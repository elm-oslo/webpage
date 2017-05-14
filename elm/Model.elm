module Model
    exposing
        ( Model
        , Msg(..)
        , Page(..)
        , Sponsor
        , SponsorTier(..)
        , Speaker
        , Talk
        , sponsors
        , speakers
        )

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
    { name : String
    , bio : String
    , imageUrl : String
    }


type alias Talk =
    { title : String
    , abstract : String
    , speaker : Speaker
    }


sponsors : List Sponsor
sponsors =
    [ { name = "bekk"
      , url = "https://www.bekk.no"
      , imageUrl = "images/bekk_logo.svg"
      , tier = Gold
      }
    , { name = "blank"
      , url = "https://www.blank.no"
      , imageUrl = "images/blank_logo.svg"
      , tier = Gold
      }
    , { name = "kodemaker"
      , url = "https://www.kodemaker.no"
      , imageUrl = "images/kodemaker_logo.svg"
      , tier = Gold
      }
    , { name = "iterate"
      , url = "https://www.iterate.no"
      , imageUrl = "images/iterate.svg"
      , tier = Gold
      }
    , { name = "knowit"
      , url = "https://www.knowit.no"
      , imageUrl = "images/knowit.svg"
      , tier = Gold
      }
    , { name = "arktekk"
      , url = "https://www.arktekk.no"
      , imageUrl = "images/arktekk.svg"
      , tier = Silver
      }
    , { name = "monokkel"
      , url = "https://www.monokkel.io"
      , imageUrl = "images/monokkel.svg"
      , tier = Silver
      }
    ]


speakers : List Speaker
speakers =
    [ { name = "Richard Feldman"
      , bio = "Richard is the author of “Elm in Action” from Manning Publications, and the instructor for the Frontend Masters two-Day Elm Workshop. When he’s not writing about Elm, teaching Elm, speaking about Elm, or co-hosting the San Francisco Elm meetup, he likes to take a break from his job at NoRedInk (where front-end programmers spend almost almost all their coding time writing production Elm code) by kicking back and working on some of his open-source Elm projects. Some have said he’s “into Elm,” but he’s not sure where they got that wild idea."
      , imageUrl = "images/richard.jpg"
      }
    , { name = "Noah Hall"
      , bio = "Noah Hall has been active in the Elm community for over three years, having used Elm in production since version 0.15. He has been a contributor to Elm both in code, ideas, and feedback, and now runs the Elm community Github group as well as the Elm Slack team. He used to work as a researcher focusing on the influence of functional programming on modern web development at university, before he joined NoRedInk as the first hire motivated to join because of Elm. At NRI he focused on tooling, ops, and frontend development. Now he works at Fusetools, but remains very active in the Elm community."
      , imageUrl = "images/noah.jpg"
      }
    , { name = "Luke Westby"
      , bio = "Luke Westby is a cofounder and partner at HumbleSpark in Chicago, IL, USA. He is the creator of the browser-based Elm editor Ellie and an active member of the Elm community. He loves contributing to the Elm community by speaking about the language, answering questions in Slack, writing blog posts, and organizing the Chicago Elm Meetup."
      , imageUrl = "images/luke.jpg"
      }
    ]
