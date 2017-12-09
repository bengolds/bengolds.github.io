module Projects.Spearmints exposing (spearmints)

import Project exposing (..)
import Element exposing (text)


spearmints : Project style variation msg
spearmints =
    { title = "Spearmints"
    , description = "room-scale VR escape game"
    , imageLocation = "spearmints-icon.png"
    , clipletLocation = "spearmints.webm"
    , url = "https://spearmints.itch.io/no-1"
    , page = text "spearmints"
    }
