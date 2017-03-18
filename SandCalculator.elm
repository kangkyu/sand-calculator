module SandCalculator exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view model =
  div []
    [ h4 [] [ text "How much do I need?"]
    , input [ type_ "text", onInput Length] []
    , input [ type_ "text", onInput Width] []
    , input [ type_ "text", onInput Depth] []
    , viewResult (calculatePounds model)
    ]

viewResult number =
  let
    result =
      "You need " ++ (toString number) ++ " pounds"
  in
    h4 [] [ text result]

calculatePounds model =
  (parseFloat model.length) *
  (parseFloat model.width) *
  (parseFloat model.depth)

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
    Width width ->
      { model | width = width}
    Depth depth ->
      { model | depth = depth}

type Msg =
  Length String | Width String | Depth String

initialModel =
  { length = "", width = "", depth = ""}

type alias Model =
  { length : String, width : String, depth : String}
