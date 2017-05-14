module Route exposing (..)

import Html exposing (Attribute)
import Html.Attributes as Attr
import UrlParser as Url
import Navigation exposing (Location)


type Route
    = Home
    | About
    | Speakers
    | Schedule
    | CodeOfConduct


route : Url.Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home (Url.s "")
        , Url.map About (Url.s "about")
        , Url.map Speakers (Url.s "speakers")
        , Url.map Schedule (Url.s "schedule")
        , Url.map CodeOfConduct (Url.s "codeofconduct")
        ]


routeToString : Route -> String
routeToString r =
    let
        url =
            case r of
                Home ->
                    ""

                About ->
                    "about"

                Speakers ->
                    "speakers"

                Schedule ->
                    "schedule"

                CodeOfConduct ->
                    "codeofconduct"
    in
        "#/" ++ url


href : Route -> Attribute msg
href route =
    Attr.href (routeToString route)


modifyUrl : Route -> Cmd msg
modifyUrl =
    routeToString >> (Debug.log "ROUTE") >> Navigation.modifyUrl


fromLocation : Location -> Maybe Route
fromLocation location =
    if String.isEmpty location.hash then
        Just Home
    else
        Url.parseHash route location
