module Main exposing (main)

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
        ( model, cmd ) =
            setRoute (Route.fromUrl url) { page = Nothing, navKey = navKey }
    in
    ( model
    , Cmd.batch
        [ cmd
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
                [ div []
                    [ canvas [ id "sketch", class "backdrop" ]
                        []
                    ]
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

        -- , node "script" [ src "animation/three.min.js" ] []
        ]
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


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
