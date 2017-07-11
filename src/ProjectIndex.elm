module ProjectIndex exposing (element, styles, Styles)

import Element exposing (Element, text, el, empty, row, wrappedRow, column, link)
import Element.Attributes exposing (maxWidth, maxHeight, width, height, padding, paddingXY, spacing, px, percent)
import Style exposing (..)
import StyleHelpers exposing (font, scaledFont)
import ElementHelpers exposing (image)
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
            [ Border.right 1
            ]
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
        , style CategoryName
            --[ Font.bold
            [ Color.text Color.black
            , scaledFont 1
            ]
        ]


element : Element Styles variation msg
element =
    column None [ padding 16, spacing 32 ] (List.map category categories)


category : Category style variation msg -> Element Styles variation msg
category ( title, projects ) =
    column Category [ spacing 16 ] <|
        [ el CategoryName [] (text title)
        , wrappedRow None [ spacing 16 ] (List.map chip projects)
        ]


chip : Project style variation msg -> Element Styles variation msg
chip project =
    link ("#/projects/" ++ project.url) <|
        row Chip
            [ width (px 320), height (px 80), spacing 8 ]
            [ chipImage project
            , column TextArea
                [ paddingXY 0 8, spacing 8 ]
                [ el Title [] (text project.title)
                , el Description [] (text project.description)
                ]
            ]


chipImage : Project style variation msg -> Element Styles variation msg
chipImage project =
    el ImageArea [ width (px 80), height (percent 100) ] empty
        |> Element.within
            [ image project.imageLocation
                StaticImage
                [ width (percent 100)
                , height (percent 100)
                ]
                empty
            , image project.clipletLocation
                Cliplet
                [ width (percent 100)
                , height (percent 100)
                ]
                empty
            ]
