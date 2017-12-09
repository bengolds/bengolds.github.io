module ProjectIndex exposing (element, styles, Styles)

import Element exposing (Element, text, el, empty, row, wrappedRow, column, link)
import Element.Attributes exposing (maxWidth, maxHeight, width, height, padding, paddingXY, spacing, px, percent, autoplay, loop, controls, inlineStyle)
import Style exposing (..)
import SharedStyles exposing (font, scaledFont, units, pxUnits)
import ElementHelpers exposing (image, video)
import Style.Border as Border
import Style.Color as Color
import Color
import Style.Font as Font
import Style.Transition as Transition
import Project exposing (Project)
import Projects.RainbowRacer exposing (rainbowRacer)
import Projects.Spearmints exposing (spearmints)
import Projects.Prototypes exposing (prototypes)
import Projects.Playbook exposing (playbook)
import Projects.Quillbox exposing (quillbox)
import Projects.Symmetry exposing (symmetry)


type alias Category style variation msg =
    ( String, List (Project style variation msg) )


categories : List (Category style variation msg)
categories =
    [ ( "Games", [ spearmints, rainbowRacer, prototypes ] )
    , ( "Software", [ playbook, quillbox, symmetry ] )
    ]


type Styles
    = None
    | Chip
    | TextArea
    | ImageArea
    | StaticImage
    | Cliplet
    | Title
    | Description
    | Category
    | CategoryName


styles : List (Style Styles variation)
styles =
    let
        clipTransition =
            Transition.transitions
                [ { delay = 0
                  , duration = 200
                  , easing = "ease"
                  , props = [ "opacity" ]
                  }
                ]
    in
        [ style None []
        , style ImageArea
            []
        , style StaticImage
            [ clipTransition
            , hover
                [ opacity 0
                ]
            ]
        , style Cliplet []
        , style Chip
            [ Border.all 1
            , Color.text Color.black
            , Color.border Color.black
            , hover [ Border.dashed ]
            ]
        , style Title
            [ Font.bold
            , scaledFont 1
            ]
        , style Description
            []
        , style TextArea
            []
        , style CategoryName
            [ Color.text Color.black
            , scaledFont 1
            ]
        , style Category []
        ]


element : Element Styles variation msg
element =
    column None [ spacing <| units 4 ] (List.map category categories)


category : Category style variation msg -> Element Styles variation msg
category ( title, projects ) =
    column Category [ spacing <| units 2 ] <|
        [ el CategoryName [] (text title)
        , wrappedRow None [ spacing <| units 2 ] (List.map chip projects)
        ]


chip : Project style variation msg -> Element Styles variation msg
chip project =
    link (project.url) <|
        row Chip
            [ width <| pxUnits 40, height <| pxUnits 10, spacing <| units 1 ]
            [ chipImage project
            , column TextArea
                [ paddingXY 0 (units 1), spacing <| units 1 ]
                [ el Title [] (text project.title)
                , el Description [] (text project.description)
                ]
            ]


chipImage : Project style variation msg -> Element Styles variation msg
chipImage project =
    el ImageArea [ height (percent 100), width <| pxUnits 10 ] empty
        |> Element.within
            [ image project.imageLocation
                StaticImage
                [ width (percent 100)
                , height (percent 100)
                ]
                empty
            , video project.clipletLocation
                Cliplet
                [ width (percent 100)
                , height (percent 100)
                , autoplay True
                , loop True
                , controls False
                , inlineStyle [ ( "object-fit", "fill" ) ]
                ]
                empty
            ]
