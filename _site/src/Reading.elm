module Reading exposing (element, Book, getCurrentlyReading)

import Http
import Html exposing (Html)
import Xml.Encode exposing (null)
import Xml.Decode exposing (decode)
import Xml.Query exposing (tag, string)
import Element exposing (Element, empty, row, text, image, link)
import Style exposing (StyleSheet)


type alias Book =
    { title : String
    , bookUrl : String
    , author : String
    , imageUrl : String
    }


getCurrentlyReading : (Result String Book -> a) -> Cmd a
getCurrentlyReading msg =
    Http.getString "https://crossorigin.me/https://www.goodreads.com/review/list/?key=dwzdl5zmjovl9o41basow&v=2&shelf=currently-reading&id=32332180&page=1&per_page=1&sort=position&order=a"
        |> Http.send
            (\bookResult ->
                bookResult
                    |> Result.mapError toString
                    |> Result.andThen decodeBook
                    |> msg
            )


decodeBook : String -> Result String Book
decodeBook rawXml =
    decode rawXml
        |> Result.withDefault null
        |> (\xmlDoc ->
                Result.map4 Book
                    (tag "title" string xmlDoc)
                    (tag "link" string xmlDoc)
                    (tag "author" (tag "name" string) xmlDoc)
                    (tag "image_url" string xmlDoc)
           )


type Styles
    = None


stylesheet : StyleSheet styles variation
stylesheet =
    Style.stylesheet []


element : Book -> Html msg
element book =
    Element.layout stylesheet
        (row None [] [ link book.bookUrl <| text book.title, text book.author, image book.imageUrl None [] empty ])
