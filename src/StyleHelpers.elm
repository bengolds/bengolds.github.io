module StyleHelpers exposing (..)

import Style exposing (..)
import Style.Font as Font
import Style.Scale as Scale


font : Property class variation
font =
    Font.typeface [ "Oxygen Mono", "Overpass Mono" ]


units : Int -> Float
units n =
    toFloat (n * 8)


scaled : Int -> Float
scaled =
    Scale.modular 16 1.618


scaledFont : Int -> Property class variation
scaledFont n =
    Font.size (scaled n)
