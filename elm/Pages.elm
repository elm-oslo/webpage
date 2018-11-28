module Pages exposing (viewAbout, viewCodeOfConduct, viewSchedule, viewSpeakers)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (ScheduleEntry(..), Speaker, scheduleEntries, speakers)
import Route


viewAbout : Html a
viewAbout =
    div []
        [ h2 []
            [ text "The Elm Conference With A Nordic Twist" ]
        , h3 []
            [ text "What to expect?" ]
        , p []
            [ text "A full day conference filled with interesting talks and discussions about Elm. You will get to hear a mix of talks from international speakers and experience reports from Norwegian/Nordic users." ]
        , p []
            [ text "By the end of the conference you should hopefully have an answer to the following question: " ]
        , blockquote []
            [ i []
                [ text "When is Elm the right choice?" ]
            ]
        , h3 []
            [ text "Why Elm?" ]
        , p []
            [ text "Elm is a fast-growing programming language for the web that significantly improves development speed, reliability, maintainability and developer experience. With React and Redux’s popularity on the frontend, functional programming practices are going mainstream and many are looking to Elm as the natural next step." ]
        , h3 []
            [ text "Intended audience" ]
        , p []
            [ text "The intended audience for the conference ranges from the curious JavaScript developer to the experienced functional programmer." ]
        , h3 []
            [ text "What is Elm?" ]
        , p []
            [ text "Elm is a functional language that compiles to JavaScript. It competes with projects like React as a tool for creating websites and web apps. Elm has a very strong emphasis on simplicity, ease-of-use, and quality tooling." ]
        , p []
            [ a [ href "http://elm-lang.org/" ]
                [ text "http://elm-lang.org/" ]
            ]
        , h3 []
            [ text "Where?" ]
        , p []
            [ text "The conference will be hosted at the beautiful "
            , em []
                [ text "SOMEWHERE" ]
            , text " in downtown Oslo."
            ]
        , h3 []
            [ text "Pre-Conference Workshop" ]
        , p []
            [ text "A pre-conference workshop will be held at Teknologihuset (Pilestredet 56, Oslo) at 18:00-20:30 on Friday, June 9. For more information and registration, go to our page on "
            , a [ href "https://www.meetup.com/oslo-elm-meetup/events/240215989/" ]
                [ text " meetup.com" ]
            , text "."
            ]
        , h3 []
            [ text "Tickets" ]
        , p []
            [ a [ href "https://www.eventbrite.co.uk/e/oslo-elm-day-tickets-32813210195" ]
                [ text "Available now!" ]
            ]
        , h3 []
            [ text "Food" ]
        , p []
            [ text "Coffee, tea and fruit will be provided throughout the day. The ticket price includes lunch during the event and dinner at the afterparty. Please contact us if you have any dietary restrictions." ]
        , h3 []
            [ text "Afterparty" ]
        , p []
            [ text "Will be hosted at the venue. We hope to see you there!" ]
        , h3 []
            [ text "Contact us" ]
        , p []
            [ ul []
                [ li []
                    [ a [ href "https://twitter.com/osloelmday" ]
                        [ text "@OsloElmDay" ]
                    ]
                , li []
                    [ a [ href "mailto:hello@osloelmday.no" ]
                        [ text "hello@osloelmday.no" ]
                    ]
                ]
            ]
        , h3 []
            [ text "Who are we?" ]
        , p []
            [ text "The conference is organized by enthusiastic members of the Oslo Elm Meetup community." ]
        , p []
            [ ul []
                [ li []
                    [ text "Erik Wendel – "
                    , a [ href "https://twitter.com/ewndl" ]
                        [ text "@ewndl" ]
                    ]
                , li []
                    [ text "Ingar Almklov – "
                    , a [ href "https://twitter.com/ingara" ]
                        [ text "@ingara" ]
                    ]
                , li []
                    [ text "Kjetil Valle – "
                    , a [ href "https://twitter.com/kjetilvalle" ]
                        [ text "@kjetilvalle" ]
                    ]
                , li []
                    [ text "Erlend Hamberg – "
                    , a [ href "https://twitter.com/ehamberg" ]
                        [ text "@ehamberg" ]
                    ]
                , li []
                    [ text "Magnus Rundberget – "
                    , a [ href "https://twitter.com/mrundberget" ]
                        [ text "@mrundberget" ]
                    ]
                , li []
                    [ text "Noah Hall – "
                    , a [ href "https://twitter.com/eeue56" ]
                        [ text "@eeue56" ]
                    ]
                ]
            ]
        , p []
            [ h3 []
                [ text "With help from" ]
            , ul []
                [ li []
                    [ text "Jonatan Austigard – "
                    , a [ href "https://twitter.com/jonaaust" ]
                        [ text "@jonaaust" ]
                    ]
                , li []
                    [ text "Stian Veum Møllersen – "
                    , a [ href "https://twitter.com/mollerse" ]
                        [ text "@mollerse" ]
                    ]
                ]
            ]
        ]


viewCodeOfConduct : Html a
viewCodeOfConduct =
    div []
        [ h2 []
            [ text "Code of Conduct" ]
        , text "All delegates, speakers, sponsors and volunteers are required to agree with the following code of conduct. Organizers will enforce this code throughout the event."
        , h3 []
            [ text "The Quick Version" ]
        , p []
            [ text "Our conference is dedicated to providing a harassment-free conference experience for everyone, regardless of gender, gender identity and expression, age, sexual orientation, disability, physical appearance, body size, race, ethnicity, religion (or lack thereof), or technology choices. We do not tolerate harassment of conference participants in any form. Sexual language and imagery is not appropriate for any conference venue, including talks, workshops, parties, Twitter and other online media. Conference participants violating these rules may be sanctioned or expelled from the conference without a refund at the discretion of the conference organisers." ]
        , h3 []
            [ text "The Less Quick Version" ]
        , p []
            [ text "Harassment includes offensive verbal comments related to gender, gender identity and expression, age, sexual orientation, disability, physical appearance, body size, race, ethnicity, religion, technology choices, sexual images in public spaces, deliberate intimidation, stalking, following, harassing photography or recording, sustained disruption of talks or other events, inappropriate physical contact, and unwelcome sexual attention." ]
        , p []
            [ text "Participants asked to stop any harassing behavior are expected to comply immediately." ]
        , p []
            [ text "Sponsors are also subject to the anti-harassment policy. In particular, sponsors should not use sexualized images, activities, or other material. Booth staff (including volunteers) should not use sexualized clothing/uniforms/costumes, or otherwise create a sexualized environment." ]
        , p []
            [ text "If a participant engages in harassing behavior, the conference organizers may take any action they deem appropriate, including warning the offender or expulsion from the conference with no refund." ]
        , p []
            [ text "If you are being harassed, notice that someone else is being harassed, or have any other concerns, please contact a member of conference staff immediately. Conference staff can be identified by a clearly marked \"STAFF\" shirt." ]
        , p []
            [ text "Conference staff will be happy to help participants contact hotel/venue security or local law enforcement, provide escorts, or otherwise assist those experiencing harassment to feel safe for the duration of the conference. We value your attendance." ]
        , p []
            [ text "We expect participants to follow these rules at all conference venues and conference-related social events." ]
        ]


viewSpeakers : Html a
viewSpeakers =
    div []
        ([ h2 []
            [ text "Speakers" ]
         , p []
            [ text "The conference will have one track, with all talks taking place in the same room. We already have three Elm-heroes booked, but there’s room for a lot more! Depending on the amount and duration of talk submissions, we’re aiming for a normal full-length conference day of presentations.          " ]
         , p []
            [ text "There might also be a panel debate or open-space session, in order to provide an arena for discussion or Q&A within the community.          " ]
         , p []
            [ text "Our current speaker lineup consist of world-renowned Elm experts, experienced with using Elm in production." ]
         ]
            ++ List.map viewSpeaker speakers
        )


viewSpeaker : Speaker -> Html a
viewSpeaker speaker =
    article [ class "speaker" ]
        [ img [ class "speaker__image", src speaker.imageUrl ]
            []
        , div [ class "speaker__content" ]
            [ h3 [ class "speaker__name", id speaker.id ]
                [ text speaker.name ]
            , p []
                [ text speaker.bio ]
            ]
        ]


viewSchedule : Html a
viewSchedule =
    div []
        ([ h2 []
            [ text "Schedule" ]
         , p []
            [ text "Oslo Elm Day is a single-track conference, with a speaker lineup consisting of both world-renowned Elm experts and local Elm users, experienced with using Elm in production." ]
         ]
            ++ List.map viewScheduleEntry scheduleEntries
        )


viewScheduleEntry : ScheduleEntry -> Html a
viewScheduleEntry scheduleEntry =
    case scheduleEntry of
        TalkEntry talk ->
            article [ class "speaker" ]
                [ div [ class "speaker__timeslot" ]
                    [ text <| Tuple.first talk.time ]
                , div [ class "speaker__content" ]
                    [ h3 [ class "speaker__name", id talk.speaker.id ]
                        [ a [ Route.href <| Route.Speaker talk.speaker.id ] [ text talk.speaker.name ], span [] [ text (" – " ++ talk.title) ] ]
                    , p [ style "font-style" "italic" ]
                        [ text talk.abstract ]
                    ]
                ]

        NonTalk title ( start, end ) ->
            article [ class "speaker" ]
                [ div [ class "speaker__timeslot" ]
                    [ text start ]
                , div [ class "speaker__content" ]
                    [ h3 [ class "speaker__name" ]
                        [ text title ]
                    ]
                ]

        NonTalkWithDesc title desc ( start, end ) ->
            article [ class "speaker" ]
                [ div [ class "speaker__timeslot" ]
                    [ text start ]
                , div [ class "speaker__content" ]
                    [ h3 [ class "speaker__name" ]
                        [ text title ]
                    , p [ style "font-style" "italic" ]
                        [ text desc ]
                    ]
                ]
