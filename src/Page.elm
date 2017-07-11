module Page exposing (fromLocation, Page(..), toElement)

import Html exposing (Html)
import Element exposing (Element, el, empty, text)
import UrlParser exposing ((</>), s, string, map, oneOf, top, parseHash)
import Navigation exposing (Location)
import Style
import ElementHelpers exposing (styleMap)
import SharedStyles exposing (Styles(..))
import ProjectIndex
import About


type Page
    = AboutPage
    | ResumePage
    | ProjectIndexPage
    | ProjectPage String


fromLocation : Location -> Maybe Page
fromLocation location =
    parseHash pageParser location


pageParser : UrlParser.Parser (Page -> c) c
pageParser =
    oneOf
        [ map AboutPage top
        , map AboutPage <| s "about"
        , map ResumePage <| s "resume"
        , map ProjectIndexPage <| s "projects"
        , map ProjectPage <| (s "projects" </> string)
        ]


fakeLocation : String -> Location
fakeLocation path =
    { href = ""
    , host = ""
    , hostname = ""
    , protocol = ""
    , origin = ""
    , port_ = ""
    , pathname = ""
    , search = ""
    , hash = "#/" ++ path
    , username = ""
    , password = ""
    }


toElement : Page -> Element Styles variation msg
toElement page =
    case page of
        ProjectIndexPage ->
            styleMap ProjectIndexStyle identity ProjectIndex.element

        AboutPage ->
            About.element

        _ ->
            text (toString page)
