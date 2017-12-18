module Projects.Spearmints exposing (spearmints)

import Element exposing (text)
import Project exposing (..)


spearmints : Project
spearmints =
    { title = "Spearmints"
    , id = "spearmints"
    , description = "room-scale VR escape game"
    , imageLocation = "spearmints-icon.png"
    , clipletLocation = "spearmints.webm"
    , url = "https://spearmints.itch.io/no-1"
    }
