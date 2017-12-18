module Projects.Quillbox exposing (quillbox)

import Element exposing (text)
import Project exposing (..)


quillbox : Project
quillbox =
    { title = "Quillbox"
    , id = "quillbox"
    , description = "type your latex quickly"
    , imageLocation = "quill.jpg"
    , clipletLocation = ""
    , url = "quillbox"
    }
