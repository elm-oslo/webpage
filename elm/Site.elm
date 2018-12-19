module Site exposing (footer_, header_, information, nav_, viewPage)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)
import Model exposing (Msg(..), Page(..), Sponsor, SponsorTier(..))
import Pages
import Route
import Speakers
import Svg exposing (defs, g, path, svg)
import Svg.Attributes exposing (d, fill, viewBox)


viewPage : Page -> Html a
viewPage page =
    let
        ( className, content ) =
            case page of
                About ->
                    ( "about", Pages.viewAbout )

                Speakers ->
                    ( "speakers", Pages.viewSpeakers )

                Schedule ->
                    ( "schedule", Pages.viewSchedule )

                CodeOfConduct ->
                    ( "codeofconduct", Pages.viewCodeOfConduct )
    in
    section [ class <| "content__page open " ++ className ]
        [ svg [ id "shapes" ]
            []
        , nav [ class "content__menu-wrapper" ]
            [ div [ class "content__menu" ]
                [ a
                    [ classList
                        [ ( "content__menu-item", True )
                        , ( "menu-item-active", page == About )
                        ]
                    , Route.href Route.About
                    ]
                    [ text "What?" ]
                , a
                    [ classList
                        [ ( "content__menu-item", True )
                        , ( "menu-item-active", page == Speakers )
                        ]
                    , Route.href Route.Speakers
                    ]
                    [ text "Who?" ]

                -- , a
                --     [ classList
                --         [ ( "content__menu-item", True )
                --         , ( "menu-item-active", page == Schedule )
                --         ]
                --     , Route.href Route.Schedule
                --     ]
                --     [ text "Schedule" ]
                ]
            , a [ class "content__menu-close", Route.href Route.Home ]
                [ text "Close" ]
            ]
        , div [ class "content__box" ]
            [ article [ class "information__block" ]
                [ content ]
            ]
        ]


main__ : Html Msg
main__ =
    div
        [ class "overlay"
        , onClick (NavigateTo Route.Home)
        ]
        []


logo : Html a
logo =
    img [ id "logo", src "images/elm_logo_2019.svg" ] []


header_ : Html Msg
header_ =
    header [ class "header" ]
        [ h1 [ class "sr-only" ]
            [ text "Oslo Elm Day" ]
        , logo
        , p [ class "animate animate--fixed header__date" ]
            [ text "Saturday February 16" ]
        , div [ class "about_btn" ]
            [ a [ Route.href Route.About ]
                [ text "About" ]
            ]
        , div [ id "ticket_btn" ]
            [ a
                [ class "ticket_btn_a"
                , href "https://www.eventbrite.co.uk/e/oslo-elm-day-tickets-32813210195"
                , onMouseEnter TicketButtonMouseEnter
                , onMouseLeave TicketButtonMouseLeave
                , target "_blank"
                ]
                [ text "Get your ticket" ]
            ]
        , section [ class "summary" ]
            [ h3 [ class "sr-only" ]
                [ text "Summary" ]
            , ul [ class "summary__list" ]
                [ li [ class "animate animate--small seq-1" ]
                    [ text "1 day" ]
                , li [ class "animate animate--small seq-2" ]
                    [ text "2 tracks" ]
                , li [ class "animate animate--small seq-3" ]
                    [ text "18 talks" ]
                , li [ class "animate animate--small seq-4" ]
                    [ text "200 seats" ]
                ]
            ]
        ]


nav_ : Html a
nav_ =
    nav [ class "nav animate animate--fixed mobile_ticket_btn" ]
        [ a [ class "nav__signup", href "https://www.eventbrite.co.uk/e/oslo-elm-day-tickets-32813210195", target "_blank" ]
            [ text "Get your ticket" ]
        ]


footer_ : Bool -> Html a
footer_ hidden =
    let
        silver =
            Model.sponsors
                |> List.filter (\s -> s.tier == Silver)

        gold =
            Model.sponsors
                |> List.filter (\s -> s.tier == Gold)

        platinum =
            Model.sponsors
                |> List.filter (\s -> s.tier == Platinum)
    in
    footer [ classList [ ( "hidden", hidden ) ] ]
        [ div [ class "information-sponsors" ]
            [ section [ class "information__block sponsors-platinum" ]
                [ h3 [ class "platinum" ]
                    [ text "Platinum Sponsor" ]
                , p [ class "sponsor-forsale sponsor__list" ]
                    (List.map viewSponsor platinum)
                ]
            , section [ class "information__block sponsors-gold" ]
                [ h3 []
                    [ text "Gold Sponsors" ]
                , p [ class "sponsor__list" ]
                    (List.map viewSponsor gold)
                ]
            , section [ class "information__block sponsors-silver" ]
                [ h3 []
                    [ text "Silver Sponsors" ]
                , p [ class "sponsor-forsale sponsor__list" ]
                    (List.map viewSponsor silver)
                ]
            , section [ class "information__block sponsors-about" ]
                [ h3 []
                    [ text "We 💛 our sponsors" ]
                , p []
                    [ a [ href "https://drive.google.com/file/d/0B3Lh4pXvCufldDBoNC1zdXZLeVU/view", target "_blank" ]
                        [ text "Sponsor our event?" ]
                    ]
                ]
            , section [ class "information__block animate--medium seq-5 animate contact" ]
                [ h2 []
                    [ text "Contact" ]
                , ul []
                    [ li []
                        [ a [ href "https://twitter.com/osloelmday" ]
                            [ text "@OsloElmDay" ]
                        ]
                    , li []
                        [ a [ href "mailto:hello@osloelmday.no" ]
                            [ text "hello@osloelmday.no" ]
                        ]
                    ]
                , ul []
                    [ li []
                        [ a [ Route.href Route.CodeOfConduct ]
                            [ text "Code of Conduct" ]
                        ]
                    ]
                ]
            ]
        ]


viewSponsor : Sponsor -> Html a
viewSponsor s =
    a [ href s.url, target "_blank" ]
        [ img
            [ class <| "sponsor__logo " ++ s.name
            , src s.imageUrl
            ]
            []
        ]


information : Html Msg
information =
    div [ class "information" ]
        [ section [ class "information__block animate--medium seq-2 animate what" ]
            [ h2 []
                [ text "What?" ]
            , p []
                [ span []
                    [ text "A one-day conference about the "
                    , a [ href "http://elm-lang.org/", target "_blank" ]
                        [ text "Elm programming language" ]
                    , text " and practical use of Elm in Norway and the Nordics."
                    ]
                ]
            , p [ class "morespacebro" ]
                [ text "The conference will be held in the awesome venue of "
                , a [ href "https://goo.gl/maps/JGAXK2cdq1R2" ]
                    [ text "Moonfish Café (Månefisken)" ]
                , text "."
                ]
            , a [ Route.href Route.About ]
                [ text "Read more" ]
            ]
        , section [ class "information__block animate--medium seq-3 animate who" ]
            [ h2 []
                [ text "Who?" ]
            , viewPromotedSpeakers
            ]
        , section [ class "information__block animate--medium seq-4 animate why" ]
            [ h2 []
                [ text "Why?" ]
            , p []
                [ text "The Nordic Elm community is growing rapidly, with large interest for the local meetups and Elm topics on practically every tech conference. Several local companies have started experimenting with Elm in their projects and it’s time to start sharing our experiences.          " ]
            ]
        ]


viewPromotedSpeakers : Html Msg
viewPromotedSpeakers =
    let
        viewSpeaker speaker =
            li [ class "who__list-item" ]
                [ div [ class "who__avatar" ]
                    [ img [ alt speaker.name, src speaker.imageUrl ]
                        []
                    ]
                , a
                    [ class speaker.id
                    , Route.href <| Route.Speaker speaker.id
                    ]
                    [ text speaker.name ]
                ]
    in
    ul [ class "who__list" ] <|
        List.map viewSpeaker
            [ Speakers.richard
            , Speakers.tessa
            , Speakers.kris
            , Speakers.matthew
            ]
