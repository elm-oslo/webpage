module Main exposing (Model, Msg(..), ServerError(..), SubmitStatus(..), emailInput, emailSubscribeForm, init, main, postEmail, submitButton, subscriptions, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Http exposing (Error)
import Json.Decode as Decode
import Json.Encode as Encode
import Task exposing (Task)


type alias Model =
    { email : String
    , error : Maybe ServerError
    , emailSubmitStatus : SubmitStatus
    }


type SubmitStatus
    = Requested
    | Completed
    | NotStarted


type ServerError
    = InvalidEmail
    | UnknownError


type Msg
    = Email String
    | SubmitRequested
    | SubmitCompleted (Result Error ())


init : ( Model, Cmd Msg )
init =
    ( { email = "", error = Nothing, emailSubmitStatus = NotStarted }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Email email ->
            ( { model | email = email, error = Nothing }, Cmd.none )

        SubmitRequested ->
            ( { model | emailSubmitStatus = Requested }, Http.send SubmitCompleted (postEmail model.email) )

        SubmitCompleted (Ok _) ->
            ( { model | email = "", error = Nothing, emailSubmitStatus = Completed }, Cmd.none )

        SubmitCompleted (Err error) ->
            let
                errorType =
                    case error of
                        Http.BadStatus { status } ->
                            if status.code == 400 then
                                InvalidEmail

                            else
                                UnknownError

                        _ ->
                            UnknownError
            in
            ( { model | error = Just errorType, emailSubmitStatus = Completed }, Cmd.none )


view : Model -> Html.Html Msg
view model =
    div []
        [ main_ []
            [ div [ class "container" ]
                [ h1 [] [ text "Oslo Elm Day 2019" ]
                , article []
                    [ p [ class "email-subscribe__intro" ] [ text "We're hard at work planning the next Oslo Elm Day. Want to know what's happening? Sign up for our email updates!" ]
                    , emailSubscribeForm model
                    , p [ class "email-subscribe__privacy-policy" ]
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
        ]



-- TODO replace email subscribe form with confirmation on success ???
-- TODO spinner on button when submitting (or other way to indicate submit in progress)


emailSubscribeForm : Model -> Html.Html Msg
emailSubscribeForm model =
    let
        submitSuccessfull =
            model.error == Nothing && model.emailSubmitStatus == Completed

        classes =
            [ ( "email-subscribe__form", True )
            , ( "email-subscribe__form--success", submitSuccessfull )
            ]
    in
    section [ classList classes ]
        [ emailInput model
        , submitButton model
        , formFeedbackMessage model
        ]


emailInput : Model -> Html.Html Msg
emailInput model =
    let
        isInvalid =
            model.error == Just InvalidEmail

        submitSuccessfull =
            model.error == Nothing && model.emailSubmitStatus == Completed

        classes =
            [ ( "email-subscribe__input", True )
            , ( "email-subscribe__input--invalid", isInvalid )
            ]
    in
    -- TODO send SubmitRequested on enter
    input
        [ classList classes
        , type_ "text"
        , disabled submitSuccessfull
        , placeholder "Email"
        , value model.email
        , onInput Email
        ]
        []


submitButton : Model -> Html.Html Msg
submitButton model =
    let
        isLoading =
            model.emailSubmitStatus == Requested

        submitSuccessfull =
            model.error == Nothing && model.emailSubmitStatus == Completed

        classes =
            [ ( "email-subscribe__submit", True )
            , ( "email-subscribe__submit--loading", isLoading )
            ]

        spinnerClasses =
            [ ( "spinner", isLoading )
            ]
    in
    button
        [ classList classes
        , disabled submitSuccessfull
        , type_ "button"
        , onClick SubmitRequested
        ]
        [ text "Sign me up!"
        , span [ classList spinnerClasses ] []
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


formFeedbackMessage : Model -> Html msg
formFeedbackMessage model =
    case ( model.error, model.emailSubmitStatus ) of
        ( Just InvalidEmail, _ ) ->
            div [ class "email-subscribe__message email-subscribe__message--error" ]
                [ text "The email is invalid" ]

        ( Just UnknownError, _ ) ->
            div [ class "email-subscribe__message email-subscribe__message--error" ]
                [ text "Something went wrong, please try again later" ]

        ( _, Completed ) ->
            div [ class "email-subscribemessage" ]
                [ text "Yay! You have been subscribed successfully 🎉" ]

        ( _, _ ) ->
            div [] []


postEmail : String -> Http.Request ()
postEmail email =
    let
        url =
            "https://a9qtvb8mjc.execute-api.us-east-1.amazonaws.com/default/email-subscribe"

        body =
            Http.jsonBody <|
                Encode.object
                    [ ( "email", Encode.string email )
                    ]

        decoder =
            Decode.succeed ()
    in
    Http.post url body decoder
