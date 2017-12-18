module Msg exposing (..)

import Navigation exposing (Location)
import Reading exposing (Book)


type Msg
    = UrlChange Location
    | BookReceived (Result String Book)
    | ResetCliplet String
