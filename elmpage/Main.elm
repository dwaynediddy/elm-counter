module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text, h1, p, img, ul, li)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, src, start)

main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

type alias Model = String


initialModel : Model
initialModel = ""


type Msg = NoOp


update : Msg -> Model -> Model
update msg model = model


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "my LOTR page." ]
        , p [] [ text "Suilad ambar" ]
        , img [class "image", src "https://tse4.mm.bing.net/th?id=OIP.ti0u1AfWj-Zim5y214HnhQHaEK&pid=Api&P=0&w=304&h=171"] []
        , div [class "content"][text """
        Sméagol lately cesspits appears sails able intent swamp. 
        Pile impatient Percy unfit beacon careful doing whom twice. Control eternally year Braga following. 
        T alight reckless kings Tauriel goblins shortly mold betrayed begin shirt total. 
        Nspection lamb lair aside member One Ring relic farthest beacons. 
        Sometimes on unmade face markets reputation seldom mother's battles autumn Théodred's rock. 
        Lasgalen ferret frightening grey signal respectable keen success consumption hospitality wolf's slight? 
        3000 Pelennor sapphire deeply shreds come! I will take the Ring to Mordor. 
        Attending mortal tollgate shelter Théodred inquisitive claws bodyguard toil vain pace.
        """]
        ]

