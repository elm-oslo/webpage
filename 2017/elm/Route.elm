module Route exposing (..)

import Html exposing (Attribute)
import Html.Attributes as Attr
import UrlParser as Url exposing ((</>))
import Navigation exposing (Location)


type Route
    = Home
    | About
    | Speakers
    | Speaker String
    | Schedule
    | CodeOfConduct


route : Url.Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home (Url.s "")
        , Url.map About (Url.s "about")
        , Url.map Speakers (Url.s "speakers")
        , Url.map Speaker (Url.s "speakers" </> Url.string)
        , Url.map Schedule (Url.s "schedule")
        , Url.map CodeOfConduct (Url.s "codeofconduct")
        ]


routeToString : Route -> String
routeToString r =
    case r of
        Home ->
            ""

        About ->
            "about"

        Speakers ->
            "speakers"

        Speaker s ->
            "speakers/" ++ s

        Schedule ->
            "schedule"

        CodeOfConduct ->
            "codeofconduct"


routeToUrl : Route -> String
routeToUrl r =
    "#/" ++ (routeToString r)


href : Route -> Attribute msg
href route =
    Attr.href (routeToUrl route)


modifyUrl : Route -> Cmd msg
modifyUrl =
    routeToUrl >> Navigation.modifyUrl


fromLocation : Location -> Maybe Route
fromLocation location =
    if String.isEmpty location.hash then
        Just Home
    else
        Url.parseHash route location
