module Model exposing (Model, Msg(..), Page(..))

import Animation
import Route exposing (Route)


type Page
    = About
    | Speakers
    | CodeOfConduct


type Msg
    = AnimationMsg Animation.Msg
    | SetRoute (Maybe Route)
    | NavigateTo Route


type alias Model =
    { anim : Animation.Model
    , page : Maybe Page
    }
