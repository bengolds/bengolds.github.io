port module Main exposing (..)

import Element exposing (el, empty)
import Element.Attributes exposing (paddingXY)
import ElementHelpers exposing (..)
import Header
import Html exposing (..)
import Html.Attributes exposing (href, rel)
import Json.Encode
import Msg exposing (Msg(..))
import Navigation exposing (Location)
import Page exposing (Page, fromLocation)
import Reading exposing (Book)
import SharedStyles exposing (units)
import Stylesheet exposing (Styles(..), stylesheet)


--main : Program Never Model Msg


main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
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

        ResetCliplet name ->
            ( model, sendInfoOut (ResetClipletOut name) )


type alias GenericOutsideData =
    { tag : String, data : Json.Encode.Value }


type InfoForOutside
    = ResetClipletOut String


port outport : GenericOutsideData -> Cmd msg


sendInfoOut : InfoForOutside -> Cmd Msg
sendInfoOut info =
    case info of
        ResetClipletOut name ->
            outport { tag = "ResetCliplet", data = Json.Encode.string name }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ node "link" [ rel "stylesheet", href "https://fonts.googleapis.com/css?family=Oxygen|Oxygen+Mono" ] []
        , Element.layout stylesheet
            (el Top
                []
                (Element.column None
                    []
                    [ styleMap HeaderStyle identity Header.element
                    , el None [ paddingXY (units 4) (units 2) ] <| Page.toElement model.page
                    ]
                )
            )

        --, case model.currentlyReading of
        --Err err ->
        --text err
        --Ok book ->
        --Reading.element book
        ]
