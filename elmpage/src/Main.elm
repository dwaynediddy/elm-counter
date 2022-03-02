module Main exposing (main)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)

-- MAIN

main : Program () Model Msg
main =
  Browser.sandbox { init = init, update = update, view = view }
-- MODEL
type alias Model = String

init : Model
init = ""

type Msg = NoOp
--UPDATE

update : Msg -> Model -> Model
update msg model = model
--VIEW 
view : Model -> Html Msg
view model = 
    div [class "main"
    , style "display" "flex"
    ,style "flex-direction" "column"
    ,style "height" "100vh"
    , style "width" "100vw"
    ]
        [
            h2 [
            class "header"
            , style "text-align" "center"
            ]
            [
            text "Elm Fullscreen"
            ]
            ,div [
            class "content"
            ,style "text-align" "center"
            ][
            text " content"
            ]
            ,footer [
            class "footer"
            ,style "height" "50px"
            ,style "margin-top" "auto"
            ,style "text-align" "center"
            ]
            [
            text "contact email@email.com or phone +123 456 7890"
            ]
        ]





