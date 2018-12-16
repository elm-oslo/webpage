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
    svg [ id "logo", viewBox "0 0 442 408.5" ]
        [ g [ fill "white" ]
            [ path [ d "M71.6,128.9c-30.6,0-53.5-22.8-53.5-53.9S41,21.1,71.6,21.1s53.5,22.8,53.5,53.9S102.2,128.9,71.6,128.9z M71.6,30.6c-26.4,0-42.2,20.7-42.2,44.4s15.8,44.4,42.2,44.4s42.2-20.7,42.2-44.4S98,30.6,71.6,30.6z" ]
                []
            , path [ d "M178.4,74.6c-2.9-5.5-7.7-9.1-14.6-9.1c-6.7,0-14.1,2.9-14.1,10.1c0,6.4,4.5,8.7,13.3,10.7l9.7,2.3 c9.4,2.2,16.5,9,16.5,18.6c0,14.8-13.2,20.9-26.4,20.9c-10.3,0-19.7-3.6-26.1-13.2l8.3-5.7c3.9,6.1,9.9,10.1,17.8,10.1 c7.8,0,15.9-3.5,15.9-11.3c0-6.8-5.8-9.1-12.9-10.9l-9.3-2.2c-4.6-1.2-17.4-4.9-17.4-17.8c0-14.1,12.3-20.4,25.1-20.4 c9.4,0,18.3,3.3,22.6,12.2L178.4,74.6z" ]
                []
            , path [ d "M216,126.3h-9.6V16.7h9.6V126.3z" ]
                []
            , path [ d "M271.5,128.1c-21,0-36-15.2-36-35.7s14.9-35.7,36-35.7c21.2,0,36.1,15.2,36.1,35.7S292.7,128.1,271.5,128.1 z M271.5,65.4c-15.7,0-25.5,11.7-25.5,27s9.9,27,25.5,27c15.8,0,25.7-11.7,25.7-27S287.3,65.4,271.5,65.4z" ]
                []
            , path [ d "M215.9,248.6h54.9v9.6h-65.4V155.5h63.6v9.6h-53.2v34.9h49.7v9.6h-49.7V248.6z" ]
                []
            , path [ d "M299.7,258.2h-9.6V148.6h9.6V258.2z" ]
                []
            , path [ d "M322.7,205.4c0-5.1-0.4-10-0.7-15.1h10.3v10.3h0.3c4.6-7.8,13.8-12,21.9-12c7.4,0,17.1,2.5,21.6,14.1 c3.9-8.7,13.2-14.1,22.3-14.1c17.3,0,25.5,9.7,25.5,26.5v43.1h-9.6v-39.6c0-13.8-3.9-21.3-17.1-21.3c-14.2,0-19.1,12.2-19.1,24.8 v36.1h-9.6v-39.6c0-13.8-3.9-21.3-17.1-21.3c-2.3,0-19.1,1.3-19.1,26.1v34.8h-9.6V205.4z" ]
                []
            , path [ d "M72.8,254.3h34.1c25.7,0,53.9,17.1,53.9,51.3c0,34.2-28.3,51.3-53.9,51.3H72.8V254.3z M83.2,347.4h20.3 c31.3,0,46-20.6,46-41.8c0-21.2-14.6-41.8-46-41.8H83.2V347.4z" ]
                []
            , path [ d "M221.7,315.4v-1.7c0-11.7-5.7-17.5-17.4-17.5c-8,0-14.9,2.8-20.7,8l-5.8-6.8c6.2-6.4,15.9-9.9,28.7-9.9 c13.3,0,24.8,7.5,24.8,24.1v30.3c0,5.2,0.6,11.6,1.2,15.2h-9.3c-0.6-3.3-0.9-7.4-0.9-11H222c-5.5,9-13,12.8-23.9,12.8 c-12,0-23.3-6.7-23.3-19.9c0-22,26-23.5,42.2-23.5H221.7z M216.8,323.2c-9.7,0-31.6,0.7-31.6,14.4c0,9,8.3,12.5,15.9,12.5 c13.9,0,20.6-9.9,20.6-21.9v-4.9H216.8z" ]
                []
            , path [ d "M278.7,345.2l20.7-56.1H311l-33.9,85.5c-4.1,10.4-9.6,17.1-21.3,17.1c-2.9,0-5.9-0.1-8.8-1l1-9.3 c2.2,1.2,4.6,1.6,7.2,1.6c6.7,0,10.1-4.5,13-12.2l4.9-13l-27.8-68.7h12L278.7,345.2z" ]
                []
            ]
        ]


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
                    [ text "18 talks" ]
                , li [ class "animate animate--small seq-3" ]
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
