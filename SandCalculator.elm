module SandCalculator exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { length : String
    , width : String
    , depth : String
    }


initialModel : Model
initialModel =
    { length = ""
    , width = ""
    , depth = ""
    }


type Msg
    = Length String
    | Width String
    | Depth String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Length length ->
            { model | length = length }

        Width width ->
            { model | width = width }

        Depth depth ->
            { model | depth = depth }


view : Model -> Html Msg
view model =
    div []
        [ h4 [] [ text "How much do I need?" ]
        , input [ type_ "text", onInput Length ] []
        , input [ type_ "text", onInput Width ] []
        , input [ type_ "text", onInput Depth ] []
        , viewResult (calculatePounds model)
        ]


viewResult : Float -> Html Msg
viewResult pounds =
    let
        result =
            if pounds > 0 then
                "You need " ++ (toString pounds) ++ " pounds"
            else
                ""
    in
        h4 [] [ text result ]


calculatePounds : Model -> Float
calculatePounds model =
    let
        l =
            parseFloat model.length

        w =
            parseFloat model.width

        d =
            parseFloat model.depth
    in
        l * w * d


parseFloat : String -> Float
parseFloat string =
    String.toFloat string
        |> Result.withDefault 0.0


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
