module Projects.Playbook exposing (playbook)

import Project exposing (..)
import Element exposing (text)


playbook : Project style variation msg
playbook =
    { title = "Playbook"
    , description = "raising math from the dead"
    , imageLocation = "playbook.png"
    , clipletLocation = "playbook.webm"
    , url = "playbook"
    , page = text "playbook"
    }
