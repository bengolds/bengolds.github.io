module About exposing (..)

import Stylesheet exposing (Styles(..))
import Element exposing (Element, el, text, textLayout, empty, column)
import Element.Attributes exposing (width, height, maxWidth, maxHeight, px, center, verticalCenter, padding, paddingXY, spacing, spacingXY, alignLeft, alignRight)
import SharedStyles exposing (units, pxUnits)
import ElementHelpers exposing (image)


element : Element Styles variation msg
element =
    let
        paragraph string =
            Element.paragraph BodyText [] [ text string ]
    in
        el None [ alignLeft ] <|
            textLayout None
                [ spacingXY (units 2) (units 2)
                , maxWidth (pxUnits 80)
                ]
                [ el None
                    [ alignRight ]
                    (image "headshot.jpg"
                        None
                        [ width <| pxUnits 20
                        , height <| pxUnits 20
                        ]
                        (empty)
                    )
                , el Label [] (text "About me")
                , paragraph "I live for the feeling of a system coming alive in my mind. What was once a set of impenetrable symbols becomes a lens through which the whole world looks different."
                , paragraph "Mathematics gives us the language and mindset to probe the world. Interactive visualizations bring those findings to life. Game development engages our whole body and brain to embed these systems in our bones."
                , paragraph "While at University, I learned how to make whatever I imagined come alive on a screen. At Pixar, I learned how to build tools to translate from the inner vision to the outer world. And at Google, I learned how to help people work together to bring their visions to life. Now, I'd like to discover new ways to see the world and give those lenses to everyone."
                ]
