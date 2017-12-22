module Pages.About exposing (..)

import Element exposing (Element, column, el, empty, text, textLayout)
import Element.Attributes exposing (alignLeft, alignRight, center, height, maxHeight, maxWidth, padding, paddingXY, px, spacing, verticalCenter, width)
import ElementHelpers exposing (image)
import SharedStyles exposing (pxUnits, units)
import Stylesheet exposing (Styles(..))


element : Element Styles variation msg
element =
    let
        paragraph string =
            Element.paragraph BodyText [] [ text string ]
    in
    el None [ alignLeft ] <|
        textLayout None
            [ spacing (units 2)
            , maxWidth (pxUnits 80)
            ]
            [ el None
                [ alignRight ]
                (image "headshot.jpg"
                    None
                    [ width <| pxUnits 20
                    , height <| pxUnits 20
                    ]
                    empty
                )
            , el Label [] (text "About me")
            , paragraph "I like to make science and math come to life. I do this by transforming written words and equations into something you can poke and prod. Everyone transforms the systems they learn about into these interactive toys; they're just usually trapped inside of people's heads. I want to bring them out into the world so that we can all play with them together."
            , paragraph "I started pursing these ideas when studying interactive graphics at Stanford. Since then, I've worked at Pixar and Google. I left Google in 2016 to explore. Some of those explorations are captured on this website! Many others are secret explorations, tucked away in my heart."
            , paragraph "When I'm not in front of a screen, I'm practicing aikido, going backpacking, or reading some Vonnegut. If you want to get a hold of me, I can be found at theotherben (at) gmail.com"
            ]
