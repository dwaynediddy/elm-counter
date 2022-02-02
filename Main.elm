module Main exposing (..)
import Html exposing (..)
import Browser exposing (sandbox)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main = Browser.sandbox
        {init = initModel, update = update, view = view}

--model
type alias Model =
    Int

initModel : Model
initModel = 
    0

--update

type Msg 
    = AddCalorie
    | Clear

--update takes a message and a model and returns a model
update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            model + 1
            
        Clear ->
            initModel

--view
--create appropriate html considering the current model/state of app
view : Model -> Html Msg
view model =
    div []
    [ h3 []
        [ text ("Total Calories: " ++ (String.fromInt model))]
    , button
        [type_ "button"
        , onClick AddCalorie
        ]
        [ text "Add"]
    , button
        [type_ "button"
        , onClick Clear
        ]
        [ text "Clear"]
    ]