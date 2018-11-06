module Main exposing (main)

import Animation
import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..), Page(..))
import Ports
import Route exposing (Route)
import Site
import Url exposing (Url)


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url navKey =
    let
        ( animModel, animCmd ) =
            Animation.init

        ( model, cmd ) =
            setRoute (Route.fromUrl url) { anim = animModel, page = Nothing, navKey = navKey }
    in
    ( model
    , Cmd.batch
        [ Cmd.map AnimationMsg animCmd
        , cmd
        , Ports.init ()
        ]
    )


routeToPage : Route -> Maybe Page
routeToPage route =
    case route of
        Route.Home ->
            Nothing

        Route.About ->
            Just About

        Route.Speakers ->
            Just Speakers

        Route.Speaker s ->
            Just Speakers

        Route.Schedule ->
            Just Schedule

        Route.CodeOfConduct ->
            Just CodeOfConduct


setRoute : Maybe Route -> Model -> ( Model, Cmd Msg )
setRoute mbRoute model =
    let
        scrollCmd =
            case mbRoute of
                Just (Route.Speaker s) ->
                    Ports.scrollToId s

                _ ->
                    Cmd.none

        newPage =
            mbRoute
                |> Maybe.andThen routeToPage

        animCmd =
            if newPage /= Nothing then
                Ports.triggerAnim ()

            else
                Cmd.none
    in
    ( { model | page = newPage }
    , Cmd.batch
        [ scrollCmd
        , animCmd
        ]
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        AnimationMsg animationMsg ->
            let
                ( animModel, animMsg ) =
                    Animation.update animationMsg model.anim
            in
            ( { model | anim = animModel }, Cmd.map AnimationMsg animMsg )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl model.navKey (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Nav.load href
                    )

        UrlChanged url ->
            setRoute (Route.fromUrl url) model

        NavigateTo route ->
            ( model, Route.modifyUrl model.navKey route )

        TicketButtonMouseEnter ->
            ( model, Ports.startBuyTicketAnim () )

        TicketButtonMouseLeave ->
            ( model, Ports.stopBuyTicketAnim () )


view : Model -> Browser.Document Msg
view model =
    let
        pageOpen =
            case model.page of
                Just _ ->
                    True

                Nothing ->
                    False
    in
    { title = "Oslo Elm Day 2017"
    , body =
        [ main_ [ classList [ ( "content-open", pageOpen ) ] ]
            [ Site.header_
            , Site.nav_
            , div [ class "backdrop-wrapper animate" ]
                [ Html.map AnimationMsg <| Animation.view model.anim
                ]
            , Site.information
            ]
        , Site.footer_ pageOpen
        , div
            [ classList
                [ ( "overlay", True )
                , ( "open", pageOpen )
                ]
            , onClick (NavigateTo Route.Home)
            ]
            []
        , case model.page of
            Just page ->
                Site.viewPage page

            Nothing ->
                text ""
        ]
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map AnimationMsg (Animation.subscriptions model.anim)


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }
