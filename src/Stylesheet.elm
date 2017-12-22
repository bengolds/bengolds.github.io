module Stylesheet exposing (Styles(..), stylesheet)

import Color
import Header
import Pages.ProjectIndex as ProjectIndex
import SharedStyles exposing (font, scaledFont)
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font
import Style.Sheet


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
        , style Link
            [ Font.lineHeight 1.2
            , Font.typeface [ "Oxygen" ]
            , Font.underline
            , Color.text Color.darkCharcoal
            , hover
                [ Color.background Color.gray
                ]
            , pseudo "visited"
                [ Color.text Color.darkCharcoal
                ]
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
    | Link
    | HeaderStyle Header.Styles
    | ProjectIndexStyle ProjectIndex.Styles
