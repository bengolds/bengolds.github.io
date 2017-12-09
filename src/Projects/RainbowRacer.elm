module Projects.RainbowRacer exposing (rainbowRacer)

import Project exposing (..)
import Element exposing (text)


rainbowRacer : Project style variation msg
rainbowRacer =
    { title = "Rainbow Racer"
    , description = "adrenalized arcade game"
    , imageLocation = "rainbowracer.png"
    , clipletLocation = "rainbowracer.webm"
    , url = "rainbow-racer"
    , page = text "rainbow racerrrr"
    }
