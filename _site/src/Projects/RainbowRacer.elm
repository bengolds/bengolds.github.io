module Projects.RainbowRacer exposing (rainbowRacer)

import Project exposing (..)
import Element exposing (text)


rainbowRacer : Project style variation msg
rainbowRacer =
    { title = "Rainbow Racer"
    , description = "bogus game"
    , imageLocation = "rainbowracer.jpg"
    , clipletLocation = ""
    , url = "rainbow-racer"
    , page = text "rainbow racerrrr"
    }
