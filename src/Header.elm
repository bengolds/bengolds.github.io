module Header exposing (..)

import Color
import Element exposing (Element, column, el, empty, image, link, row, screen, text)
import Element.Attributes exposing (..)
import Reading
import SharedStyles exposing (font, pxUnits, units)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Shadow as Shadow


type Styles
    = None
    | Top
    | Header
    | Link
    | Name


styles : List (Style Styles variation)
styles =
    [ style None []
    , style Top [ font, Color.text Color.black ]
    , style Header
        [ Border.bottom 1
        , Color.background Color.white
        ]
    , style Link
        [ Color.text Color.darkCharcoal
        , hover
            [ Color.background Color.gray
            ]
        , pseudo "visited"
            [ Color.text Color.darkCharcoal
            ]
        ]
    , style Name
        [ Font.bold
        , Color.text Color.black
        , pseudo "visited"
            [ Color.text Color.black
            ]
        ]
    ]


element : Element Styles variation msg
element =
    column None [] [ header, spacer ]


header : Element Styles variation msg
header =
    screen <|
        el Top
            [ alignTop, width (percent 100) ]
            (row None [] <|
                [ row Header
                    [ paddingXY (units 4) 0
                    , spacing (units 4)
                    , height (pxUnits headerHeight)
                    , alignLeft
                    , verticalCenter
                    , width (percent 100)
                    ]
                    [ name
                    , textLink "Projects" "#/projects"
                    , textLink "About me" "#/about"

                    --, textLink "Resumé" "#/resume"
                    ]
                ]
            )


spacer : Element Styles variation msg
spacer =
    el None [ height <| pxUnits headerHeight ] empty


headerHeight : Int
headerHeight =
    10


name : Element Styles variation msg
name =
    link "#/about" <|
        column Name
            [ alignLeft ]
            [ el None [] <| text "Ben"
            , el None [] <| text "Goldsmith"
            ]


textLink : String -> String -> Element Styles variation msg
textLink content url =
    link url <| el Link [] (text content)
