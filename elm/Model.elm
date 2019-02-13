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
import Dict exposing (Dict)
import Route exposing (Route)
import Speakers exposing (Speaker)
import Talks exposing (Slottime, Talk)
import Url


type Page
    = About
    | Speakers
    | Schedule
    | Talks
    | CodeOfConduct


type Msg
    = TicketButtonMouseEnter
    | TicketButtonMouseLeave
    | NavigateTo Route
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | ExpandableItemClicked String
    | NoOp


type alias Model =
    { navKey : Nav.Key
    , page : Maybe Page
    , expandableStuff : Dict String Bool
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


type ScheduleEntry
    = TalkEntry Talk
    | NonTalk String Slottime
    | NonTalkWithDesc String String Slottime


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
    , { name = "rakuten"
      , url = "https://global.rakuten.com/corp/"
      , imageUrl = "images/rakuten_logo.svg"
      , tier = Silver
      }
    , { name = "blank"
      , url = "https://blank.no/"
      , imageUrl = "images/blank_logo.svg"
      , tier = Gold
      }
    , { name = "arktekk"
      , url = "https://arktekk.no/"
      , imageUrl = "images/arktekk_logo.svg"
      , tier = Silver
      }
    , { name = "knowit"
      , url = "https://knowit.no/"
      , imageUrl = "images/knowit_logo.svg"
      , tier = Gold
      }
    , { name = "finn"
      , url = "https://finn.no/"
      , imageUrl = "images/finn_logo.svg"
      , tier = Silver
      }
    ]


scheduleEntries : List ScheduleEntry
scheduleEntries =
    []
