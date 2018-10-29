module Main exposing (..)

import Animation
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..), Page(..))
import Navigation exposing (Location)
import Ports
import Route exposing (Route)
import Site


init : Location -> ( Model, Cmd Msg )
init loc =
    let
        ( animModel, animCmd ) =
            Animation.init

        ( model, cmd ) =
            setRoute (Route.fromLocation loc) { anim = animModel, page = Nothing }
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
                    (Ports.scrollToId s)

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

        SetRoute mbRoute ->
            setRoute mbRoute model

        NavigateTo route ->
            ( model, Route.modifyUrl route )

        TicketButtonMouseEnter ->
            ( model, Ports.startBuyTicketAnim () )

        TicketButtonMouseLeave ->
            ( model, Ports.stopBuyTicketAnim () )


view : Model -> Html.Html Msg
view model =
    let
        pageOpen =
            case model.page of
                Just _ ->
                    True

                Nothing ->
                    False
    in
        Html.div []
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


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map AnimationMsg (Animation.subscriptions model.anim)


main : Program Never Model Msg
main =
    Navigation.program (Route.fromLocation >> SetRoute)
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }