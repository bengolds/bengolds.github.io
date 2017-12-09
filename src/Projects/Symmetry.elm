module Projects.Symmetry exposing (symmetry)

import Element exposing (text)
import Project exposing (..)


symmetry : Project style variation msg
symmetry =
    { title = "Symmetry"
    , description = "explore the symmetries of tetrahedra"
    , imageLocation = "symmetry.jpg"
    , clipletLocation = ""
    , url = "https://bengolds.github.io/Symmetry-Explorer/"
    , page = text "symmetry"
    }
