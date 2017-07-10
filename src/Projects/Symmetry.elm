module Projects.Symmetry exposing (symmetry)

import Project exposing (..)
import Element exposing (text)


symmetry : Project style variation msg
symmetry =
    { title = "Symmetry"
    , description = "bogus game"
    , imageLocation = "symmetry.jpg"
    , clipletLocation = ""
    , url = "symmetry"
    , page = text "symmetry"
    }
