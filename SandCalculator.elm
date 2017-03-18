module SandCalculator exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view model =
  div []
    [ h4 [] [ text "How much do I need?"]
    , input [ type_ "text", onInput Length] []
    , viewResult (calculatePounds model)
    ]

viewResult number =
  let
    result =
      "You need " ++ (toString number) ++ " pounds"
  in
    h4 [] [ text result]

calculatePounds model =
  parseFloat model.length

parseFloat string =
  String.toFloat string
  |> Result.withDefault 0.0

main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }

update msg model =
  case msg of
    Length length ->
      { model | length = length }

type Msg = Length String

initialModel =
  { length = "0", width = "", depth = ""}

type alias Model =
  { length : String, width : String, depth : String}
