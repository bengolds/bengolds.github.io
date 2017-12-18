module Projects.Playbook exposing (playbook)

import Element exposing (text)
import Project exposing (..)


playbook : Project
playbook =
    { title = "Playbook"
    , id = "playbook"
    , description = "raising math from the dead"
    , imageLocation = "playbook.png"
    , clipletLocation = "playbook.webm"
    , url = "playbook"
    }
