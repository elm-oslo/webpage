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
      , tier = Platinum
      }
    , { name = "kodemaker"
      , url = "https://www.kodemaker.no"
      , imageUrl = "images/kodemaker_logo.svg"
      , tier = Gold
      }
    , { name = "scelto"
      , url = "https://scelto.no/"
      , imageUrl = "images/scelto_logo.svg"
      , tier = Gold
      }
    , { name = "lovdata"
      , url = "https://lovdata.no/"
      , imageUrl = "images/lovdata_logo.svg"
      , tier = Gold
      }
    , { name = "eggs"
      , url = "https://eggsdesign.com/"
      , imageUrl = "images/eggs_logo.svg"
      , tier = Gold
      }
    , { name = "dialog-exe"
      , url = "https://www.dx.no"
      , imageUrl = "images/dx_logo.svg"
      , tier = Silver
      }
    ]


scheduleEntries : List ScheduleEntry
scheduleEntries =
    []
