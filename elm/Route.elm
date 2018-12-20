module Route exposing (Route(..), fromUrl, href, modifyUrl, route, routeToString)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser as Url exposing ((</>))


type Route
    = Home
    | About
    | Speakers
    | Speaker String
    | Schedule
    | Talks
    | CodeOfConduct


route : Url.Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home (Url.s "")
        , Url.map About (Url.s "about")
        , Url.map Speakers (Url.s "speakers")
        , Url.map Speaker (Url.s "speakers" </> Url.string)
        , Url.map Schedule (Url.s "schedule")
        , Url.map Talks (Url.s "talks")
        , Url.map CodeOfConduct (Url.s "codeofconduct")
        ]


routeToString : Route -> String
routeToString r =
    "#/"
        ++ (case r of
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

                Talks ->
                    "talks"

                CodeOfConduct ->
                    "codeofconduct"
           )


href : Route -> Attribute msg
href r =
    Attr.href (routeToString r)


modifyUrl : Nav.Key -> Route -> Cmd msg
modifyUrl key =
    routeToString >> Nav.replaceUrl key


{-| Lifted from: <https://github.com/rtfeldman/elm-spa-example/blob/master/src/Route.elm#L59-L65>
-}
parseUrlFragmentAsPath : Url.Url -> Maybe Route
parseUrlFragmentAsPath url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Url.parse route


fromUrl : Url -> Maybe Route
fromUrl url =
    if url.fragment |> Maybe.withDefault "" |> String.isEmpty then
        Just Home

    else
        parseUrlFragmentAsPath url
