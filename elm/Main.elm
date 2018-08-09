module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


type alias Model =
    {}


type Msg
    = NoOp


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Html.Html Msg
view model =
    div []
        [ main_ []
            [ div [ class "container" ]
                [ h1 [] [ text "Oslo Elm Day 2019" ]
                , p [] [ text "Stay tuned" ]
                , p [] [ text "Subscribe stuff....." ]
                , p [ class "privacy-policy" ]
                    [ span []
                        [ text "We will occasionally send you updates with information related to the next installment of Oslo Elm Day. " ]
                    , span
                        []
                        [ text "We only store your email address and nothing else. " ]
                    , span
                        []
                        [ text "If you want to be taken off the mailing list, please send an email to " ]
                    , a [ href "mailto:hello@osloelmday.com?subject=Unsubscribe" ] [ text "hello@osloelmday.com" ]
                    , span [] [ text " from the email address you registered with." ]
                    ]
                ]
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
