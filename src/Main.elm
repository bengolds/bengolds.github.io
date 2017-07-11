module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (rel, href)
import Header
import ElementHelpers exposing (..)
import SharedStyles exposing (..)
import Element exposing (el, empty)
import Navigation exposing (Location)
import Page exposing (Page, fromLocation)
import Reading exposing (Book)


--main : Program Never Model Msg


main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { page = Page.fromLocation location |> Maybe.withDefault Page.AboutPage
      , currentlyReading = Err "no book"
      }
    , Reading.getCurrentlyReading BookReceived
    )



-- MODEL


type alias Model =
    { page : Page
    , currentlyReading : Result String Book
    }



-- UPDATE


type Msg
    = UrlChange Location
    | BookReceived (Result String Book)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            case fromLocation location of
                Nothing ->
                    ( model, Cmd.none )

                Just page ->
                    ( { model | page = page }, Cmd.none )

        BookReceived bookResult ->
            ( { model | currentlyReading = bookResult }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ node "link" [ rel "stylesheet", href "https://fonts.googleapis.com/css?family=Overpass+Mono|Oxygen+Mono" ] []
        , Element.layout stylesheet
            (el Top
                []
                (Element.column None
                    []
                    [ styleMap HeaderStyle identity Header.element
                    , Page.toElement model.page
                    ]
                )
            )

        --, case model.currentlyReading of
        --Err err ->
        --text err
        --Ok book ->
        --Reading.element book
        ]
