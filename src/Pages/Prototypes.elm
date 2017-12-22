module Pages.Prototypes exposing (element)

import Element exposing (Element, column, el, empty, text, textLayout)
import Element.Attributes exposing (alignLeft, alignRight, center, height, maxHeight, maxWidth, padding, paddingXY, px, spacing, spacingXY, verticalCenter, width)
import ElementHelpers exposing (image)
import SharedStyles exposing (pxUnits, units)
import Stylesheet exposing (Styles(..))


element : Element Styles variation msg
element =
    column None
        [ maxWidth (pxUnits 120)
        , spacing (units 4)
        ]
        [ section "Perspective Prototype"
            "perspective.png"
            [ paragraph "After playing The Witness, I was inspired to work on a puzzle game that explored perspective effects. Players solve the game's puzzles by switching between a 3D world and its 2D perspective projection. "
            , Element.paragraph BodyText
                []
                [ text "It's all much easier to understand by watching "
                , link "https://www.youtube.com/watch?v=fuOfg4JDFz8" "a quick playthrough of the prototype."
                ]
            , Element.paragraph BodyText
                []
                [ text "This project was also a fun excuse to play with "
                , link "/assets/watercolor.png" "watercolor"
                , text " "
                , link "/assets/watercolor.mp4" "shaders."
                ]
            ]
        , section "Exquisine"
            "exquisine.png"
            [ paragraph "You run an intergalactic restaurant with customers from all over the cosmos. Every key on your keyboard prepares a different dish. Make sure to prepare the right dish for each customer!"
            , Element.paragraph BodyText
                []
                [ link "/assets/exquisine.mp4" "This was a very silly game."
                ]
            ]
        ]


link target linkText =
    Element.link target (el Link [] (text linkText))


paragraph string =
    Element.paragraph BodyText [] [ text string ]


section title imageSrc contents =
    textLayout None
        [ spacing (units 2) ]
        ([ image imageSrc
            None
            [ alignRight
            , width (pxUnits 32)
            , height (pxUnits 32)
            ]
            empty
         , el Label [] (text title)
         ]
            ++ contents
        )
