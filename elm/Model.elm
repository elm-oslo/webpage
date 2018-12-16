module Model exposing
    ( Model
    , Msg(..)
    , Page(..)
    , ScheduleEntry(..)
    , Sponsor
    , SponsorTier(..)
    , scheduleEntries
    , sponsors
    )

import Browser
import Browser.Navigation as Nav
import Route exposing (Route)
import Speakers exposing (Speaker)
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


scheduleEntries : List ScheduleEntry
scheduleEntries =
    []
