module Pages.ProjectIndex exposing (Styles, element, styles)

import Color
import Element exposing (Element, column, el, empty, link, row, text, wrappedRow)
import Element.Attributes exposing (autoplay, controls, height, id, inlineStyle, loop, maxHeight, maxWidth, padding, paddingXY, percent, px, spacing, width)
import Element.Events exposing (onMouseEnter)
import ElementHelpers exposing (image, video)
import Msg exposing (Msg(..))
import Project exposing (Project)
import Projects.Playbook exposing (playbook)
import Projects.Prototypes exposing (prototypes)
import Projects.Quillbox exposing (quillbox)
import Projects.RainbowRacer exposing (rainbowRacer)
import Projects.Spearmints exposing (spearmints)
import Projects.Symmetry exposing (symmetry)
import SharedStyles exposing (font, pxUnits, scaledFont, units)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Transition as Transition


type alias Category =
    ( String, List Project )


categories : List Category
categories =
    [ ( "Games", [ spearmints, rainbowRacer, prototypes ] )
    , ( "Software", [ playbook, symmetry ] )
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


element : Element Styles variation Msg
element =
    column None [ spacing <| units 4 ] (List.map category categories)


category : Category -> Element Styles variation Msg
category ( title, projects ) =
    column Category [ spacing <| units 2 ] <|
        [ el CategoryName [] (text title)
        , wrappedRow None [ spacing <| units 2 ] (List.map chip projects)
        ]


chip : Project -> Element Styles variation Msg
chip project =
    link project.url <|
        row Chip
            [ width <| pxUnits 40
            , height <| pxUnits 10
            , spacing <| units 1
            , id project.id
            ]
            [ chipImage project
            , column TextArea
                [ paddingXY 0 (units 1), spacing <| units 1 ]
                [ el Title [] (text project.title)
                , el Description [] (text project.description)
                ]
            ]


chipImage : Project -> Element Styles variation Msg
chipImage project =
    let
        videoId =
            project.id ++ "-cliplet"
    in
    el ImageArea
        [ height (percent 100)
        , width <| pxUnits 10
        , onMouseEnter (ResetCliplet videoId)
        ]
        empty
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
                , id videoId
                ]
                empty
            ]
