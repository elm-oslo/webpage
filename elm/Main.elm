module Main exposing (..)

import Animation
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html.Lazy
import Model exposing (Model, Msg(..), Page(..))
import Navigation exposing (Location)
import Ports
import Random
import Random.List
import Route exposing (Route)
import Site
import Static.Speakers


init : Location -> ( Model, Cmd Msg )
init loc =
    let
        ( animModel, animCmd ) =
            Animation.init

        ( model, cmd ) =
            setRoute (Route.fromLocation loc)
                { anim = animModel
                , page = Nothing
                , highlightedSpeakers = []
                }
    in
        ( model
        , Cmd.batch
            [ Cmd.map AnimationMsg animCmd
            , cmd
            , Ports.init ()
            , Static.Speakers.all
                |> Random.List.shuffle
                |> Random.map (List.take 3)
                |> Random.generate HighlightedSpeakersGenerated
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

        Route.Stories ->
            Just Stories


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

        HighlightedSpeakersGenerated speakers ->
            ( { model | highlightedSpeakers = speakers }, Cmd.none )


view : Model -> Html.Html Msg
view model =
    let
        pageOpen =
            case model.page of
                Just _ ->
                    True

                Nothing ->
                    False

        staticView v =
            Html.Lazy.lazy (always v) model.page
    in
        Html.div []
            [ main_ [ classList [ ( "content-open", pageOpen ) ] ]
                [ staticView Site.header_
                , staticView Site.nav_
                , div [ class "backdrop-wrapper animate" ]
                    [ Html.map AnimationMsg <| Animation.view model.anim
                    ]
                , Html.Lazy.lazy Site.information model
                ]
            , Html.Lazy.lazy Site.footer_ pageOpen
            , staticView
                (div
                    [ classList
                        [ ( "overlay", True )
                        , ( "open", pageOpen )
                        ]
                    , onClick (NavigateTo Route.Home)
                    ]
                    []
                )
            , staticView
                (case model.page of
                    Just page ->
                        Site.viewPage page

                    Nothing ->
                        text ""
                )
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
