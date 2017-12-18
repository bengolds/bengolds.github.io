module Page exposing (Page(..), fromLocation, toElement)

import About
import Element exposing (Element, el, empty, text)
import ElementHelpers exposing (styleMap)
import Msg exposing (Msg(..))
import Navigation exposing (Location)
import ProjectIndex
import Stylesheet exposing (Styles(..))
import UrlParser exposing ((</>), map, oneOf, parseHash, s, string, top)


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


toElement : Page -> Element Styles variation Msg
toElement page =
    case page of
        ProjectIndexPage ->
            styleMap ProjectIndexStyle identity ProjectIndex.element

        AboutPage ->
            About.element

        _ ->
            text (toString page)
