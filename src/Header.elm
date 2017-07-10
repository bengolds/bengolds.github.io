module Header exposing (..)

import Element exposing (Element, el, column, row, image, link, text, empty, screen)
import Element.Attributes exposing (..)
import Style exposing (..)
import StyleHelpers exposing (font)
import Style.Border as Border
import Style.Font as Font
import Style.Color as Color
import Style.Shadow as Shadow
import Color
import Reading


type Styles
    = None
    | Top
    | Header
    | Link


styles : List (Style Styles variation)
styles =
    [ style None []
    , style Top [ font ]
    , style Header
        [ Border.bottom 2

        --, Style.shadows
        --[ Shadow.box
        --{ offset = ( 0, 0 )
        --, size = 6
        --, blur = 12
        --, color = Color.rgba 0 0 0 0.25
        --}
        --]
        , Color.background Color.white
        ]
    , style Link
        --[ Font.underline
        [ Color.text Color.black
        , hover
            [ Color.background Color.gray
            ]
        ]
    ]


element : Element Styles variation msg
element =
    column None [] [ header, spacer ]


header : Element Styles variation msg
header =
    el Top
        [ alignTop, width (percent 100) ]
        (row Header
            [ padding 16
            , spacing 32
            , height (px headerHeight)
            , verticalCenter
            , alignLeft
            , width (percent 100)
            ]
            [ logo
            , textLink "Projects" "#/projects"
            , textLink "About me" "#/about"
            , textLink "Resumé" "#/resume"
            ]
        )
        |> screen


spacer : Element Styles variation msg
spacer =
    el None [ height (px (headerHeight + 16)) ] empty


headerHeight : Float
headerHeight =
    80


logo : Element Styles variation msg
logo =
    image "/assets/logo.jpg" None [ height (px 40), width (px 200) ] empty


textLink : String -> String -> Element Styles variation msg
textLink content url =
    link url <| el Link [] (text content)
