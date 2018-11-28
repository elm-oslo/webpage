module Model exposing
    ( Model
    , Msg(..)
    , Page(..)
    , ScheduleEntry(..)
    , Speaker
    , Sponsor
    , SponsorTier(..)
    , scheduleEntries
    , speakers
    , sponsors
    )

import Browser
import Browser.Navigation as Nav
import Route exposing (Route)
import Url


type Page
    = About
    | Speakers
    | Schedule
    | CodeOfConduct


type Msg
    = TicketButtonMouseEnter
    | TicketButtonMouseLeave
    | NavigateTo Route
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | NoOp


type alias Model =
    { navKey : Nav.Key
    , page : Maybe Page
    }


type SponsorTier
    = Silver
    | Gold
    | Platinum


type alias Sponsor =
    { name : String
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
    , time : Slottime
    }


type ScheduleEntry
    = TalkEntry Talk
    | NonTalk String Slottime
    | NonTalkWithDesc String String Slottime


type alias Slottime =
    ( String, String )


sponsors : List Sponsor
sponsors =
    [ { name = "bekk"
      , url = "https://www.bekk.no"
      , imageUrl = "images/bekk_logo.svg"
      , tier = Gold
      }
    , { name = "kodemaker"
      , url = "https://www.kodemaker.no"
      , imageUrl = "images/kodemaker_logo.svg"
      , tier = Gold
      }
    ]


richard : Speaker
richard =
    { id = "richard"
    , name = "Richard Feldman"
    , bio = "Richard is the author of “Elm in Action” from Manning Publications, and the instructor for the Frontend Masters two-Day Elm Workshop. When he’s not writing about Elm, teaching Elm, speaking about Elm, or co-hosting the San Francisco Elm meetup, he likes to take a break from his job at NoRedInk (where front-end programmers spend almost almost all their coding time writing production Elm code) by kicking back and working on some of his open-source Elm projects. Some have said he’s “into Elm,” but he’s not sure where they got that wild idea."
    , imageUrl = "images/richard.jpg"
    }


speakers : List Speaker
speakers =
    [ richard
    ]


scheduleEntries : List ScheduleEntry
scheduleEntries =
    []
