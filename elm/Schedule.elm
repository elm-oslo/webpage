module Schedule exposing (view)

import DateFormat
import Dict exposing (Dict)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Markdown
import Model exposing (Msg(..))
import Route
import Talks exposing (Talk)
import Time
import Time.Extra as Time


view : Dict String Bool -> Html Msg
view expandableStuff =
    div []
        [ div [ class "schedule__day" ]
            [ h2 [] [ text "Friday 15 – Pre-Conference" ]
            , viewPreConf expandableStuff
            ]
        , div [ class "schedule__day" ]
            [ h2 [] [ text "Saturday 16 –\u{00A0}Main Conference" ]
            , viewSchedule expandableStuff
            ]
        ]


type Room
    = Room1
    | Room2


type alias Duration =
    Int


type ScheduleEntry
    = SingleTalk Talk Duration
    | DoubleTalk Talk Talk Duration
    | Hidden String Duration
    | Other String Duration


schedule : List ScheduleEntry
schedule =
    [ Other "Introduction" 10
    , SingleTalk Talks.richard 40
    , Hidden "Break" 5
    , SingleTalk Talks.ossi 20
    , Hidden "Break" 20
    , DoubleTalk
        Talks.luca
        Talks.brian
        20
    , Hidden "Break" 10
    , DoubleTalk
        Talks.teodor
        Talks.emma
        20
    , Hidden "Break" 10
    , DoubleTalk
        Talks.einar
        Talks.james
        20
    , Hidden "Break" 20
    , SingleTalk
        Talks.tessa
        30
    , Other "Lunch" 60
    , SingleTalk
        Talks.matthew
        30
    , Hidden "Break" 10
    , DoubleTalk
        Talks.dan
        Talks.robin
        20
    , Hidden "Break" 10
    , DoubleTalk
        Talks.jonas
        Talks.filip
        20
    , Hidden "Break" 10
    , DoubleTalk
        Talks.ju
        Talks.viktor
        20
    , Hidden "Break" 20
    , SingleTalk
        Talks.manuel
        20
    , Hidden "Break" 5
    , SingleTalk
        Talks.kris
        30
    , Other "Wrap up" 5
    , Hidden "Break" 30
    , Other "Dinner" 90
    , Other "Party 🎉" 240
    ]


viewSchedule : Dict String Bool -> Html Msg
viewSchedule expandableStuff =
    let
        startTime =
            Time.partsToPosix timeZone
                { year = 2019
                , month = Time.Feb
                , day = 16
                , hour = 10
                , minute = 0
                , second = 0
                , millisecond = 0
                }
    in
    schedule
        |> List.foldl
            (\entry ( t, items ) ->
                let
                    dur =
                        duration entry

                    endTime =
                        t
                            |> Time.add Time.Minute dur timeZone
                in
                ( endTime, ( t, entry ) :: items )
            )
            ( startTime, [] )
        |> Tuple.second
        |> List.reverse
        |> List.map (viewScheduleEntry expandableStuff)
        |> div []


viewPreConf : Dict String Bool -> Html Msg
viewPreConf expandableStuff =
    let
        key =
            "pre-conf-workshop"

        startTime =
            Time.partsToPosix timeZone
                { year = 2019
                , month = Time.Feb
                , day = 15
                , hour = 17
                , minute = 0
                , second = 0
                , millisecond = 0
                }

        startTimeBeer =
            Time.partsToPosix timeZone
                { year = 2019
                , month = Time.Feb
                , day = 15
                , hour = 20
                , minute = 0
                , second = 0
                , millisecond = 0
                }
    in
    div []
        [ div [ id key, class "scheduleEntry" ]
            [ div [ class "scheduleEntry__heading" ]
                [ div [ class "scheduleEntry__heading--left" ]
                    [ text <|
                        timeFormatter timeZone startTime
                    ]
                , div [ class "scheduleEntry__heading--right" ]
                    []
                ]
            , div [ class "scheduleEntry__body" ]
                [ div [ class "scheduleEntry__body--track" ]
                    [ text "Location:" ]
                , div [ class "scheduleEntry__body--description" ]
                    [ p
                        []
                        [ text "Folq"
                        , br [] []
                        , text "Youngs gate 7"
                        , br [] []
                        , text "0181 Oslo"
                        ]
                    , br [] []
                    , h3 []
                        [ div []
                            [ text <|
                                "Elm-GraphQL Workshop"
                            ]
                        , a
                            [ href "https://twitter.com/dillontkearns"
                            ]
                            [ text "Dillon Kearns" ]
                        ]
                    , viewExpandableItem expandableStuff key <|
                        div []
                            [ p []
                                [ div []
                                    [ i []
                                        [ text "The pre-conference is sponsored by"
                                        ]
                                    ]
                                , br [] []
                                , a
                                    [ href "https://folq.no"
                                    , target "_blank"
                                    , class "schedule__preconfsponsorlogoContainer"
                                    ]
                                    [ img
                                        [ class "schedule__preconfsponsorlogo"
                                        , src "images/folq_logo.svg"
                                        ]
                                        []
                                    ]
                                ]
                            , p []
                                [ Markdown.toHtml [] preConfWorkshopDescription ]
                            ]
                    ]
                ]
            ]
        , div [ id key, class "scheduleEntry" ]
            [ div [ class "scheduleEntry__heading" ]
                [ div [ class "scheduleEntry__heading--left" ]
                    [ text <|
                        timeFormatter timeZone startTimeBeer
                    ]
                , div [ class "scheduleEntry__heading--right" ]
                    []
                ]
            , div [ class "scheduleEntry__body" ]
                [ div [ class "scheduleEntry__body--track" ]
                    [ text "Location:" ]
                , div [ class "scheduleEntry__body--description" ]
                    [ p
                        []
                        [ text "Smelteverket"
                        , br [] []
                        , text "Vulkan 5"
                        , br [] []
                        , text "0182 Oslo"
                        ]
                    , br [] []
                    , h3 []
                        [ div []
                            [ text <|
                                "Pre-conference hangout"
                            ]
                        ]
                    , div []
                        [ p []
                            [ text "After the workshop, there’ll be a a chance to meet other attendees along with the organizers and speakers at Smelteverket." ]
                        ]
                    ]
                ]
            ]
        ]


viewScheduleEntry : Dict String Bool -> ( Time.Posix, ScheduleEntry ) -> Html Msg
viewScheduleEntry expandedStuff ( startTime, entry ) =
    let
        viewTalk t r =
            let
                key =
                    "talk-" ++ t.title
            in
            div [ id key, class "scheduleEntry__body" ]
                [ div [ class "scheduleEntry__body--track" ]
                    [ text <| room r ]
                , div [ class "scheduleEntry__body--description" ]
                    [ h3 []
                        [ div []
                            [ text <|
                                t.title
                            ]
                        , a
                            [ Route.href <| Route.Speaker t.speaker.id
                            ]
                            [ text t.speaker.name ]
                        ]
                    , viewExpandableItem expandedStuff key <|
                        p
                            []
                            [ Markdown.toHtml [] t.abstract ]
                    ]
                ]

        time d =
            timeFormatter timeZone startTime
    in
    case entry of
        Hidden _ _ ->
            text ""

        Other what dur ->
            div [ class "scheduleEntry" ]
                [ div [ class "scheduleEntry__heading" ]
                    [ div [ class "scheduleEntry__heading--left" ]
                        [ text <| time dur ]
                    , div [ class "scheduleEntry__heading--right" ]
                        []
                    ]
                , div [ class "scheduleEntry__body" ]
                    [ div [ class "scheduleEntry__body--track" ] []
                    , div [ class "scheduleEntry__body--description" ]
                        [ text what ]
                    ]
                ]

        SingleTalk talk dur ->
            div [ class "scheduleEntry" ]
                [ div [ class "scheduleEntry__heading" ]
                    [ div [ class "scheduleEntry__heading--left" ]
                        [ text <| time dur ]
                    , div [ class "scheduleEntry__heading--right" ]
                        []
                    ]
                , viewTalk talk Room1
                ]

        DoubleTalk talk1 talk2 dur ->
            div [ class "scheduleEntry" ]
                [ div [ class "scheduleEntry__heading" ]
                    [ div [ class "scheduleEntry__heading--left" ]
                        [ text <| time dur ]
                    , div [ class "scheduleEntry__heading--right" ]
                        []
                    ]
                , viewTalk talk1 Room1
                , viewTalk talk2 Room2
                ]


viewExpandableItem : Dict String Bool -> String -> Html Msg -> Html Msg
viewExpandableItem expandableStuff key content =
    let
        expanded =
            expandableStuff
                |> Dict.get key
                |> Maybe.withDefault False
    in
    div
        [ classList
            [ ( "expandableItem", True )
            , ( "expandableItem--expanded", expanded )
            ]
        , onClick <|
            if expanded then
                NoOp

            else
                ExpandableItemClicked key
        ]
        [ div [ class "expandableItem__content" ]
            [ content ]
        , div [ class "expandableItem__readMore" ]
            [ div
                [ class "expandableItem__button"
                , onClick <|
                    if not expanded then
                        NoOp

                    else
                        ExpandableItemClicked key
                ]
                [ text <|
                    if expanded then
                        "Show less"

                    else
                        "Read more"
                ]
            ]
        ]


preConfWorkshopDescription : String
preConfWorkshopDescription =
    """This workshop will equip you with everything you need to make guaranteed-correct, type-safe API requests from your Elm code! And all without needing to write a single JSON Decoder by hand! This workshop is appropriate for anyone with basic Elm experience. Knowledge of GraphQL is helpful but optional.

In this hands-on workshop, the author of Elm's type-safe GraphQL query builder library, [dillonkearns/elm-graphql](https://github.com/dillonkearns/elm-graphql), will walk you through the core concepts and best practices of the library. Check out [Types Without Borders](https://www.youtube.com/watch?v=memIRXFSNkU) from the most recent Elm Conf for some of the underlying philosophy of this library. Or you can read an overview of features of this library in [this blog post](https://medium.com/open-graphql/type-safe-composable-graphql-in-elm-b3378cc8d021) or see some highlights at the bottom of this event description.

## Workshop Content
1. GraphQL core concepts overview
1. Making your first GraphQL query
1. Get it compiling, then get it right
1. Using your editor to help you build queries quickly
1. Combining fields together
1. Basics of modularizing queries - using Elm constructs instead of GraphQL Variables
1. Mapping into meaningful data structures
1. Pipelines versus map2, map3..., functions
1. Handling polymorphic types (Interfaces and Unions)
1. Handling errors
1. Paginated queries
1. What is the purpose of custom scalars in GraphQL?
1. Using custom Elm JSON decoders for your Custom Scalars
1. Advanced techniques for modularizing your API requests in Elm



## Highlight of dillonkearns/elm-graphql Features

- Provides a high-level DSL for making queries, which allows you to use Elm language constructs to build and abstract your GraphQL queries (Apollo queries are built with plain strings with a JSON object passed in for variables)
- Rather than just grabbing raw JSON data, you build up your data into meaningful data structures (much like you do with JSON decoding in Elm)
- You get Elm compiler errors if your query is invalid
- You get documentation in your editor as you build up queries (the autogenerated functions have doc comments with the docs from your GraphQL API)
- You can do exhaustive onType ... selections for unions and interfaces (the compiler will tell you if you add a new type on the back-end that you don’t handle on the client-side, and you don’t get a Maybe something back because it knows you’ve handled every possibility)
- It handles creating aliases for you to prevent collisions automatically"""


room : Room -> String
room r =
    case r of
        Room1 ->
            "Room 1"

        Room2 ->
            "Room 2"


duration : ScheduleEntry -> Duration
duration entry =
    case entry of
        Hidden _ dur ->
            dur

        Other _ dur ->
            dur

        SingleTalk _ dur ->
            dur

        DoubleTalk _ _ dur ->
            dur


timeZone : Time.Zone
timeZone =
    Time.utc


timeFormatter : Time.Zone -> Time.Posix -> String
timeFormatter =
    DateFormat.format
        [ DateFormat.hourMilitaryFixed
        , DateFormat.text ":"
        , DateFormat.minuteFixed
        ]


timeRangeFormatter : Time.Zone -> Time.Posix -> Duration -> String
timeRangeFormatter zone startTime dur =
    let
        endTime =
            startTime
                |> Time.add Time.Minute dur timeZone
    in
    timeFormatter zone startTime
        ++ " –\u{00A0}"
        ++ timeFormatter zone endTime
