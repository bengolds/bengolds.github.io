module About exposing (..)

import SharedStyles exposing (Styles(..))
import Element exposing (Element, el, text, textLayout, paragraph, empty)
import Element.Attributes exposing (width, height, px)
import ElementHelpers exposing (image, pxUnits)


element : Element Styles variation msg
element =
    textLayout None
        []
        [ el None
            []
            (image "headshot.jpg"
                None
                [ width <| pxUnits 20
                , height <| pxUnits 20
                ]
                (empty)
            )
        , paragraph None
            []
            [ text """
            - Learn by intuition first, rigor second
            - Technology probing the world and ourselves
            - Game development as a way to explore systems with your whole body and mind.
            - At Google, I learned how to organize teams to get things done.
            - At Pixar, I learned how to build tools for art.
            - At university, I learned how to make screens come alive with visuals.
            - The feeling when a system comes alive -- no longer impenetrable symbols, but a feeling in your bones. A new way to see old things.
            """
            ]
        ]
