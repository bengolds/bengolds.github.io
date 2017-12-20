port module Main exposing (..)

import Element exposing (el, empty)
import Element.Attributes exposing (paddingXY)
import ElementHelpers exposing (..)
import Header
import Html exposing (Html, div, node)
import Html.Attributes exposing (href, rel)
import Json.Encode
import Msg exposing (Msg(..))
import Navigation exposing (Location)
import Page exposing (Page)
import Pages.Render exposing (render)
import Reading exposing (Book)
import SharedStyles exposing (units)
import Stylesheet exposing (Styles(..), stylesheet)
import UrlParser exposing ((</>), map, oneOf, s, string, top)


main : Program Never Model Msg
main =
    Navigation.program locationToMsg
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        currPage =
            locationToPage location |> Maybe.withDefault Page.AboutPage
    in
    ( { page = currPage
      , currentlyReading = Err "no book"
      }
    , Cmd.batch
        [ Reading.getCurrentlyReading BookReceived
        , sendInfoOut <| SetTitle (Page.getTitle currPage)
        ]
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
        Noop ->
            ( model, Cmd.none )

        UrlChange page ->
            ( { model | page = page }, sendInfoOut <| SetTitle (Page.getTitle page) )

        BookReceived bookResult ->
            ( { model | currentlyReading = bookResult }, Cmd.none )

        ResetCliplet name ->
            ( model, sendInfoOut (ResetClipletOut name) )


locationToMsg : Location -> Msg
locationToMsg location =
    case locationToPage location of
        Just page ->
            UrlChange page

        Nothing ->
            Noop


locationToPage : Location -> Maybe Page
locationToPage location =
    UrlParser.parseHash pageParser location


pageParser : UrlParser.Parser (Page -> c) c
pageParser =
    oneOf
        [ UrlParser.map Page.AboutPage top
        , UrlParser.map Page.AboutPage <| s "about"
        , UrlParser.map Page.ResumePage <| s "resume"
        , UrlParser.map Page.ProjectIndexPage <| s "projects"
        , UrlParser.map Page.ProjectPage <| (s "projects" </> string)
        ]



-- PORTS


type alias GenericOutsideData =
    { tag : String, data : Json.Encode.Value }


type InfoForOutside
    = ResetClipletOut String
    | SetTitle String


port outport : GenericOutsideData -> Cmd msg


sendInfoOut : InfoForOutside -> Cmd Msg
sendInfoOut info =
    case info of
        ResetClipletOut name ->
            outport { tag = "ResetCliplet", data = Json.Encode.string name }

        SetTitle title ->
            outport { tag = "SetTitle", data = Json.Encode.string title }



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
                    , el None [ paddingXY (units 4) (units 2) ] <| render model.page
                    ]
                )
            )

        --, case model.currentlyReading of
        --Err err ->
        --text err
        --Ok book ->
        --Reading.element book
        ]
