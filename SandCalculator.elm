module SandCalculator exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

view model =
  div []
    [ h4 [] [ text "How much do I need?"]
    , input [ type_ "text"] []
    , input [ type_ "text"] []
    , input [ type_ "text"] []
    , h4 [] [ text "You need 370 pounds"]
    ]

main =
    Html.beginnerProgram
        { model = ""
        , view = view
        , update = update
        }

update msg model =
  model
