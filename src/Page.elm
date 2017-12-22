module Page exposing (Page(..), getTitle)


type Page
    = AboutPage
    | ResumePage
    | ProjectIndexPage
    | PrototypesPage


getTitle : Page -> String
getTitle page =
    case page of
        AboutPage ->
            "About Ben"

        ResumePage ->
            "Ben's Resumé"

        ProjectIndexPage ->
            "Ben's Projects"

        PrototypesPage ->
            "Ben's Prototypes"
