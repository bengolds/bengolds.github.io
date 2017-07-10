module Projects.Playbook exposing (playbook)

import Project exposing (..)
import Element exposing (text)


playbook : Project style variation msg
playbook =
    { title = "Playbook"
    , description = "bogus game"
    , imageLocation = "playbook.jpg"
    , clipletLocation = ""
    , url = "playbook"
    , page = text "playbook"
    }
