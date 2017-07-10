module Projects.Quillbox exposing (quillbox)

import Project exposing (..)
import Element exposing (text)


quillbox : Project style variation msg
quillbox =
    { title = "Quillbox"
    , description = "type your latex quickly"
    , imageLocation = "quill.jpg"
    , clipletLocation = ""
    , url = "quillbox"
    , page = text "quillbox"
    }
