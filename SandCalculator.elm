module SandCalculator exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view model =
  div []
    [ h4 [] [ text "How much do I need?"]
    , input [ type_ "text", onInput Length] []
    , h4 [] [ text ("You need " ++ model ++ " pounds")]
    ]

main =
    Html.beginnerProgram
        { model = "0"
        , view = view
        , update = update
        }

update msg model =
  case msg of
    Length length ->
      length

type Msg = Length String
