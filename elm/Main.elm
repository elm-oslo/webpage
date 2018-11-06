module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Http exposing (Error)
import Json.Decode as Decode
import Json.Encode as Encode
import Task exposing (Task)


type alias Model =
    { email : String
    , emailSubmitStatus : SubmitStatus
    }


type SubmitStatus
    = Requested
    | NotStarted
    | Completed
    | Failed ServerError


type ServerError
    = InvalidEmail
    | UnknownError


type Msg
    = Email String
    | SubmitRequested
    | SubmitCompleted (Result Error ())


init : () -> ( Model, Cmd Msg )
init () =
    ( { email = "", emailSubmitStatus = NotStarted }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Email email ->
            ( { model | email = email }, Cmd.none )

        SubmitRequested ->
            ( { model | emailSubmitStatus = Requested }
            , Http.send SubmitCompleted (postEmail model.email)
            )

        SubmitCompleted (Ok _) ->
            ( { model
                | email = ""
                , emailSubmitStatus = Completed
              }
            , Cmd.none
            )

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
                ( { model
                    | emailSubmitStatus = Failed errorType
                  }
                , Cmd.none
                )


view : Model -> Html.Html Msg
view model =
    div []
        [ main_ []
            [ div [ class "container" ]
                [ div [ class "logo" ]
                    [ img [ src "images/elm_logo_2019.svg" ] []
                    ]
                , article []
                    [ p [ class "email-subscribe__intro" ]
                        [ text "February 16 2019."
                        , br [] []
                        , text "Subscribe for email updates."
                        ]
                    , emailSubscribeForm model
                    , p [ class "email-subscribe__privacy-policy" ]
                        [ a [ href "https://goo.gl/TbMg6h", class "cfp-link" ] [ text "Speaker? See our CfP" ] ]
                    ]
                ]
            , viewPrivacyPolicy
            ]
        ]



-- TODO replace email subscribe form with confirmation on success ???
-- TODO spinner on button when submitting (or other way to indicate submit in progress)


emailSubscribeForm : Model -> Html.Html Msg
emailSubscribeForm model =
    let
        submitSuccessfull =
            model.emailSubmitStatus == Completed

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
            model.emailSubmitStatus == Failed InvalidEmail

        submitSuccessfull =
            model.emailSubmitStatus == Completed

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
            , placeholder "Your email"
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
            model.emailSubmitStatus == Completed

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
            [ text "Subscribe"
            , span [ classList spinnerClasses ] []
            ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


formFeedbackMessage : Model -> Html msg
formFeedbackMessage model =
    case model.emailSubmitStatus of
        Failed InvalidEmail ->
            div [ class "email-subscribe__message email-subscribe__message--error" ]
                [ text "The email is invalid" ]

        Failed UnknownError ->
            div [ class "email-subscribe__message email-subscribe__message--error" ]
                [ text "Something went wrong, please try again later" ]

        Completed ->
            div [ class "email-subscribe__message" ]
                [ text "Done! 🎉" ]

        _ ->
            div [] []


postEmail : String -> Http.Request ()
postEmail email =
    let
        url =
            "https://apcq90j6pe.execute-api.us-east-1.amazonaws.com/default/email-subscribe"

        body =
            Http.jsonBody <|
                Encode.object
                    [ ( "email", Encode.string email )
                    ]

        decoder =
            Decode.succeed ()
    in
        Http.post url body decoder


viewPrivacyPolicy : Html a
viewPrivacyPolicy =
    div [ class "privacy-policy" ]
        [ p [ class "email-subscribe__privacy-policy" ]
            [ span []
                [ text "We will occasionally send you updates with information related to the next installment of Oslo Elm Day. " ]
            , span
                []
                [ text "We only store your email address and nothing else. " ]
            , span
                []
                [ text "Contact us at " ]
            , a [ href "mailto:hello@osloelmday.com?subject=Unsubscribe" ] [ text "hello@osloelmday.com" ]
            , span [] [ text " if you want to be taken off the mailing list." ]
            ]
        ]
