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
        , talks
        )

import Dom
import Animation
import Route exposing (Route)


type Page
    = About
    | Speakers
    | Schedule
    | CodeOfConduct


type Msg
    = AnimationMsg Animation.Msg
    | SetRoute (Maybe Route)
    | NavigateTo Route
    | GoToSpeaker Dom.Id
    | NoOp


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


richard : Speaker
richard =
    { id = "richard"
    , name = "Richard Feldman"
    , bio = "Richard is the author of “Elm in Action” from Manning Publications, and the instructor for the Frontend Masters two-Day Elm Workshop. When he’s not writing about Elm, teaching Elm, speaking about Elm, or co-hosting the San Francisco Elm meetup, he likes to take a break from his job at NoRedInk (where front-end programmers spend almost almost all their coding time writing production Elm code) by kicking back and working on some of his open-source Elm projects. Some have said he’s “into Elm,” but he’s not sure where they got that wild idea."
    , imageUrl = "images/richard.jpg"
    }


noah : Speaker
noah =
    { id = "noah"
    , name = "Noah Hall"
    , bio = "Noah Hall has been active in the Elm community for over three years, having used Elm in production since version 0.15. He has been a contributor to Elm both in code, ideas, and feedback, and now runs the Elm community Github group as well as the Elm Slack team. He used to work as a researcher focusing on the influence of functional programming on modern web development at university, before he joined NoRedInk as the first hire motivated to join because of Elm. At NRI he focused on tooling, ops, and frontend development. Now he works at Fusetools, but remains very active in the Elm community."
    , imageUrl = "images/noah.jpg"
    }


luke : Speaker
luke =
    { id = "luke"
    , name = "Luke Westby"
    , bio = "Luke Westby is a cofounder and partner at HumbleSpark in Chicago, IL, USA. He is the creator of the browser-based Elm editor Ellie and an active member of the Elm community. He loves contributing to the Elm community by speaking about the language, answering questions in Slack, writing blog posts, and organizing the Chicago Elm Meetup."
    , imageUrl = "images/luke.jpg"
    }


brian : Speaker
brian =
    { id = "brian"
    , name = "Brian Hicks"
    , bio = ""
    , imageUrl = "images/brianhicks.jpg"
    }


felix : Speaker
felix =
    { id = "felix"
    , name = "Felix Lamoroux"
    , bio = ""
    , imageUrl = "images/felix.jpg"
    }


david : Speaker
david =
    { id = "david"
    , name = "David Ed Mellum"
    , bio = ""
    , imageUrl = "images/davidmellum.jpg"
    }


nils : Speaker
nils =
    { id = "nils"
    , name = "Nils Eriksson"
    , bio = ""
    , imageUrl = "images/nilserikson.jpg"
    }


erlend : Speaker
erlend =
    { id = "erlend"
    , name = "Erlend Hamberg"
    , bio = ""
    , imageUrl = "images/erlendhamberg.jpg"
    }


magnus : Speaker
magnus =
    { id = "magnus"
    , name = "Magnus Rundberget"
    , bio = ""
    , imageUrl = "images/magnusrundberget.jpg"
    }


speakers : List Speaker
speakers =
    [ richard
    , noah
    , luke
    , brian
    , felix
    , david
    , nils
    , erlend
    , magnus
    ]


talks : List Talk
talks =
    [ { title = "The State of Elm 2017"
      , abstract = "The State of Elm 2017 Survey is over and the results have been collected. Let’s look at them together! Where are new people in the community coming from? Where are they going? What’s great about Elm, and what could use improvement? In this talk, we’ll discuss these questions and what they mean for the Elm community at large."
      , speaker = brian
      }
    , { title = "Rewriting a Production SPA in Elm"
      , abstract = "You may have wondered: \" is rewriting my app to Elm worth it ? \". This talk will answer your question by following the story of how Frende ported an existing SPA to Elm. We'll look at how it was decided to go for Elm, how Elm fits into existing architecture, how it integrates with our tooling infrastructure, how our app was incrementally ported and deployed, how we got a whole team up and going Elm in no time, and much more."
      , speaker = david
      }
    , { title = "Elm Editor Support - Perspectives From an Editor Hacker"
      , abstract = "something something editors! something something editors? something something editors! something something editors? something something editors! something something editors? something something editors! something something editors? something something editors! something something editors? something something editors! something something editors? something something editors! something something editors? "
      , speaker = magnus
      }
    , { title = "Localization for Elm as a pre-build phase"
      , abstract = "Localization is usually down by providing a global dictionary function and passing the language to each view and keeping the current language in the app's model. This makes it difficult to add a second language to an existing code base and adds boiler plate code when 90% of the user's will only care for one of the supported languages. Our concept is to have a small pre-build-phase to generate multiple single-language elm apps from the same code base. "
      , speaker = felix
      }
    , { title = "Everything in Elm"
      , abstract = "During at my time at my own company, at NoRedInk, and in the open source community, I like to think I proved that anything that could be written in Javascript could also be written in Elm. This led to projects like take-home, the only full stack Elm application.\n\nIn this talk, we'll examine some of the things I've heard are \" impossible \" in Elm, such as: animation, inline-styles, writing CLI tools, writing a debugger, writing a server. We'll also discuss why some of these ideas are better off as unpublished packages, and the general problem-solving approach I take to making the unsolvable solved."
      , speaker = noah
      }
    , { title = "Putting the Elm Platform in the Browser"
      , abstract = "I wanted it to be easier for folks to try the Elm platform and share it with each other, so I made Ellie and put it in the browser! Since its release in January of this year people have shared about 5000 revisions, but this is only the beginning. I want you all to share in my appreciation for this community and my desire for it to grow, so in this talk I'm going to share the life story of Ellie. You'll feel like you were there on the day it was first released, and share my own excitement about where it's heading now and what comes next."
      , speaker = luke
      }
    , { title = "Move Fast and Don’t Break Things. Running a Startup on Elm"
      , abstract = "something something startups! something something startups? something something startups! something something startups? something something startups! something something startups? something something startups! something something startups? something something startups! something something startups? something something startups! something something startups? something something startups! something something startups?"
      , speaker = nils
      }
    , { title = "Elm i Blank"
      , abstract = ""
      , speaker = erlend
      }
    , { title = "The Design Evolution of elm-css and elm-test"
      , abstract = "I've been fortunate to participate in the design of two popular projects, elm-css and elm-test. In the course of iterating on their designs with collaborators and community members, I've learned a lot about what worked well and what didn't. This talk will dive into the design decisions that shaped the past, present, and future of elm-css and elm-test. How did these projects balance build-time guarantees, performance, and user experience? What short-term sacrifices were deemed acceptable? What long-term invariants were considered worth preserving even under pressure? What's next for these libraries, and why? Come find out!"
      , speaker = richard
      }
    ]
