module SharedStyles exposing (..)

import Style exposing (..)
import Style.Font as Font
import Style.Scale as Scale
import Element.Attributes exposing (px)


font : Property class variation
font =
    Font.typeface [ "Oxygen Mono" ]


units : Int -> Float
units n =
    let
        gridUnit =
            8
    in
        toFloat (n * gridUnit)


pxUnits n =
    px (units n)


scaled : Int -> Float
scaled =
    Scale.modular 16 (sqrt 1.618)


scaledFont : Int -> Property class variation
scaledFont n =
    Font.size (scaled n)
