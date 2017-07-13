module Stylesheet exposing (stylesheet, Styles(..))

import SharedStyles exposing (font, scaledFont)
import Style.Color as Color
import Style.Font as Font
import Color
import Style exposing (..)
import Style.Sheet
import ProjectIndex
import Header


stylesheet =
    Style.stylesheet
        [ style None []
        , style Top
            [ font
            , Color.text Color.darkCharcoal
            ]
        , style Label
            [ Color.text Color.black
            , scaledFont 2
            ]
        , style BodyText
            [ Font.lineHeight 1.2
            , Font.typeface [ "Oxygen" ]
            ]
        , Style.Sheet.merge <|
            Style.Sheet.map HeaderStyle identity Header.styles
        , Style.Sheet.merge <|
            Style.Sheet.map ProjectIndexStyle identity ProjectIndex.styles
        ]


type Styles
    = None
    | Top
    | Label
    | BodyText
    | HeaderStyle Header.Styles
    | ProjectIndexStyle ProjectIndex.Styles
