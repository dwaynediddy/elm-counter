module Main exposing (main)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Url

-- MAIN

main : Program () Model Msg
main =
  Browser.sandbox { 
    init = init
    ,update = update
    ,view = view
    }
-- MODEL
type alias Model = { 
  currentPage: Page
  , firstName : String
  , lastName : String
  , email : String
  , phone : String
  , suggestion : String
  }

init : Model
init = { 
  currentPage = Home
  , firstName = ""
  , lastName = ""
  , email = ""
  , phone = ""
  , suggestion = ""
  }

type Msg = SetPage Page 
  | SetFirstName String 
  | Last String 
  | Email String 
  | Phone String 
  | Suggestion String
  | Submit

type Page = Home | About | Contact | News
--UPDATE

update : Msg -> Model -> Model
update msg model = case msg of
  SetPage page ->
    { model | currentPage = page }
  SetFirstName first ->
    { model | firstName = first}
  Last last ->
    { model | lastName = last}
  Email email ->
    { model | email = email}
  Phone phone ->
    { model | phone = phone}
  Suggestion suggestion ->
    { model | suggestion = suggestion}
  Submit ->
    { model
      | firstName = ""
      , lastName = ""
      , email = ""
      , phone = ""
      , suggestion = ""
    }




--VIEW 
view : Model -> Html Msg
view model = case model.currentPage of
    Home ->
      div [ class "main"
          , style "display" "flex"
          , style "flex-direction" "column"
          , style "height" "100vh"
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
            , div [
            class "content"
            , style "text-align" "center"
            ]
            [
            text "content"
            ]
            , div [
            class "aboutbtn"
            ][
            button [onClick (SetPage About)] [text "About"]
            ]
            , div [
              class "contactbtn"
            ][
            button [onClick (SetPage Contact)] [text "Contact"]
            ]
            , div [
            class "newsbtn"
            ][
            button [onClick (SetPage News)] [text "News"]
            ]
            , myFooter
        ]
    About ->
      div [] [
        text "this is the about section"
        , button [onClick (SetPage Home)] [text "Home"]
        , button [onClick (SetPage Contact)][text "Contact"]
        , button [onClick (SetPage News)][text "News"]
        , div [
        style "display" "flex"
        , style "flex-direction" "column"
        , style "height" "90vh"
        , style "width" "100vw"
        ] []
        , myFooter
        ]
    Contact ->
      div []
        [ text "this is the contact section"
        , p [] [ text ("The first name is: " ++ model.firstName)]
        , p [] [ text ("The last name is: " ++ model.lastName)]
        , p [] [ text ("The email is: " ++ model.email)]
        , p [] [ text ("The phone Number is: " ++ model.phone)]
        , p [] [ text ("The suggestion is: " ++ model.suggestion)]
        , button [onClick (SetPage Home)] [text "Home"]
        , button [onClick (SetPage About)][text "About"]
        , button [onClick (SetPage News)][text "News"]
        , div [
        style "display" "flex"
        , style "flex-direction" "column"
        , style "justify-content" "center"
        , style "align-items" "center"
        , style "height" "90vh"
        , style "width" "100vw"
        ] 
        [
        div [
        style "display" "flex"
        , style "flex-direction" "column"
        , style "width" "30rem"
        , style "padding" "1rem"
        ]
        [
        label [][text "First Name"]
        , input [onInput SetFirstName][]
        , label [][text "Last Name"]
        , input [onInput Last][]
        , label [][text "Email"]
        , input [onInput Email][]
        , label [][text "Phone Number"]
        , input [onInput Phone][]
        , label [][text "Suggestions"]
        , textarea [onInput Suggestion] []
        , button [onClick Submit] [text "Submit"]
        ]
        ]
        , myFooter
        ]
    News ->
      div [] [
        text "this is the news section"
        , button [onClick (SetPage Home)] [text "Home"]
        , button [onClick (SetPage Contact)][text "About"]
        , button [onClick (SetPage News)][text "Contact"]
        , div [
        style "display" "flex"
        , style "flex-direction" "column"
        , style "height" "90vh"
        , style "width" "100vw"
        ] []
        , myFooter
        ]

myFooter =
  footer
    [ class "footer"
    , style "height" "50px"
    , style "margin-top" "auto"
    , style "text-align" "center"
    ] [ text "contact email@email.com or phone +123 456 7890" ]