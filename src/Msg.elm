module Msg exposing (..)

import Navigation exposing (Location)
import Page exposing (Page)
import Reading exposing (Book)


type Msg
    = Noop
    | UrlChange Page
    | BookReceived (Result String Book)
    | ResetCliplet String
