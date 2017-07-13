module Projects.Spearmints exposing (spearmints)

import Project exposing (..)
import Element exposing (text)


spearmints : Project style variation msg
spearmints =
    { title = "Spearmints"
    , description = "bogus game"
    , imageLocation = "spearmints.jpg"
    , clipletLocation = "spearmints-clip.gif"
    , url = "https://spearmints.itch.io/no-1"
    , page = text "spearmints"
    }
