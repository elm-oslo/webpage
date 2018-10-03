module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Http exposing (Error)
import Json.Decode as Decode
import Json.Encode as Encode
import Task exposing (Task)


type alias Model =
    { email : String
    , validateForm : Bool
    }


type Msg
    = Email String
    | ValidateForm
    | SubmitRequested
    | SubmitCompleted (Result Error ())


init : ( Model, Cmd Msg )
init =
    ( Model "" False, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Email email ->
            ( { model | email = email }, Cmd.none )

        ValidateForm ->
            ( { model | validateForm = True }, Cmd.none )

        SubmitRequested ->
            ( model, Http.send SubmitCompleted (postEmail model.email) )

        SubmitCompleted (Ok _) ->
            ( { model | email = "" }, Cmd.none )

        SubmitCompleted (Err _) ->
            -- TODO handle error
            ( model, Cmd.none )


view : Model -> Html.Html Msg
view model =
    div []
        [ main_ []
            [ div [ class "container" ]
                [ h1 [] [ text "Oslo Elm Day 2019" ]
                , p [] [ text "Stay tuned" ]
                , div []
                    [ p [] [ text "Email: " ]
                    , input [ type_ "text", placeholder "Email", value model.email, onInput Email ] []
                    , viewValidation model
                    , button [ onClick SubmitRequested ] [ text "Submit" ]
                    ]
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


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput inputType inputPlaceholder inputValue toMsg =
    input [ type_ inputType, placeholder inputPlaceholder, value inputValue, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
    if not model.validateForm then
        div [] []
    else if String.contains "@" model.email then
        div [] [ text "OK" ]
    else
        div [] [ text "Not a valid email" ]


postEmail : String -> Http.Request ()
postEmail email =
    let
        url =
            -- TODO: Use oslo-elm aws gateway post endpoint
            -- Martins aws endpoint: "https://qt3xsu1wfg.execute-api.us-east-1.amazonaws.com/default/osloElmDaySignup"
            "http://httpbin.org/post"

        body =
            Http.jsonBody <|
                Encode.object
                    [ ( "email", Encode.string email )
                    ]

        decoder =
            Decode.succeed ()
    in
    Http.post url body decoder
