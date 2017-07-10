module Page exposing (fromLocation)

import UrlParser exposing ((</>), s, string, map, oneOf)


type Page
    = About
    | Resume
    | ProjectIndex
    | ProjectPage String


fromLocation =
    oneOf
        [ map
        ]
