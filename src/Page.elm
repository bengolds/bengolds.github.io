module Page exposing (Page(..), getTitle)


type Page
    = AboutPage
    | ResumePage
    | ProjectIndexPage
    | ProjectPage String


getTitle : Page -> String
getTitle page =
    case page of
        AboutPage ->
            "About Ben"

        ResumePage ->
            "Ben's Resumé"

        ProjectIndexPage ->
            "Ben's Projects"

        ProjectPage name ->
            name
