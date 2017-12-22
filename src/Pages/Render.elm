module Pages.Render exposing (render)

import Element exposing (Element, el, empty, text)
import ElementHelpers exposing (styleMap)
import Msg exposing (Msg)
import Page exposing (Page(..))
import Pages.About as About
import Pages.ProjectIndex as ProjectIndex
import Pages.Prototypes as Prototypes
import Stylesheet exposing (Styles(..))


render : Page -> Element Styles variation Msg
render page =
    case page of
        ProjectIndexPage ->
            styleMap ProjectIndexStyle identity ProjectIndex.element

        AboutPage ->
            About.element

        PrototypesPage ->
            Prototypes.element

        _ ->
            text (toString page)
