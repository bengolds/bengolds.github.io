module Project exposing (..)

import Element exposing (Element)


type alias Project =
    { title : String
    , id : String
    , description : String
    , imageLocation : String
    , clipletLocation : String
    , url : String
    }
