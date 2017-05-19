module Model
    exposing
        ( Model
        , Msg(..)
        , Page(..)
        , Sponsor
        , SponsorTier(..)
        , Speaker
        , Talk
        , Story
        )

import Animation
import Route exposing (Route)


type Page
    = About
    | Speakers
    | Schedule
    | CodeOfConduct
    | Stories


type Msg
    = AnimationMsg Animation.Msg
    | SetRoute (Maybe Route)
    | NavigateTo Route
    | TicketButtonMouseEnter
    | TicketButtonMouseLeave
    | HighlightedSpeakersGenerated (List Speaker)
    | NoOp


type alias Model =
    { anim : Animation.Model
    , page : Maybe Page
    , highlightedSpeakers : List Speaker
    }


type SponsorTier
    = Silver
    | Gold
    | Platinum


type alias Sponsor =
    { id : String
    , name : String
    , url : String
    , imageUrl : String
    , tier : SponsorTier
    }


type alias Speaker =
    { id : String
    , name : String
    , bio : String
    , imageUrl : String
    }


type alias Talk =
    { title : String
    , abstract : String
    , speaker : Speaker
    }


type alias Story =
    { sponsor : Sponsor
    , text : String
    }
