module Project exposing (..)

import Element exposing (Element)


type alias Project style variation msg =
    { title : String
    , description : String
    , imageLocation : String
    , clipletLocation : String
    , url : String
    , page : Element style variation msg
    }
