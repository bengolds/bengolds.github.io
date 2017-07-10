module SharedStyles exposing (..)

import StyleHelpers exposing (..)
import Style exposing (..)
import Style.Color as Color
import Color
import Style.Font as Font
import Style.Scale as Scale
import Style.Sheet
import ProjectIndex
import Header


--import Style.Border as Border
--import Style.Color as Color


type Styles
    = None
    | Top
    | HeaderStyle Header.Styles
    | ProjectIndexStyle ProjectIndex.Styles


stylesheet =
    Style.stylesheet
        [ style None []
        , style Top
            [ font
            , Color.text Color.darkGray
            ]
        , Style.Sheet.merge <|
            Style.Sheet.map HeaderStyle identity Header.styles
        , Style.Sheet.merge <|
            Style.Sheet.map ProjectIndexStyle identity ProjectIndex.styles
        ]
