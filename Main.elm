module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)


-- import Html.Attributes exposing (..)


type Msg
    = Increment
    | Decrement


main =
    Html.program
        { init = ( init, Cmd.none )
        , subscriptions = (\e -> Sub.none)
        , update = update
        , view = view
        }


type alias Data =
    { number : Int
    , number2 : Int
    , number3 : Maybe Int
    }


init : Data
init =
    { number = 2, number2 = 0, number3 = Nothing }


increment model =
    { model | number = model.number + 1 }


update action model =
    case action of
        Increment ->
            ( model |> increment, Cmd.none )

        Decrement ->
            ( { model | number = model.number - 1 }, Cmd.none )


textG =
    text << toString


view model =
    div []
        [ textG model
        , button [ Html.Events.onClick Increment ] [ text "+" ]
        , button [ Html.Events.onClick Decrement ] [ text "-" ]
        ]
