module Projects.Prototypes exposing (prototypes)

import Project exposing (..)
import Element exposing (text)


prototypes : Project style variation msg
prototypes =
    { title = "Prototypes"
    , description = "bogus game"
    , imageLocation = "prototypes.jpg"
    , clipletLocation = ""
    , url = "prototypes"
    , page = text "prototypes"
    }
