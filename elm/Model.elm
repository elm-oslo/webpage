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
    [ NonTalk "Welcome and information from the organizers" ( "10:00", "10:10" )
    , TalkEntry
        { title = "The State of Elm 2017, Extended Edition"
        , abstract = "The State of Elm 2017 Survey is over and the results have been collected. Let’s look at them together! Where are new people in the community coming from? Where are they going? What’s great about Elm, and what could use improvement? In this talk, we’ll discuss these questions and what they mean for the Elm community at large."
        , speaker = brian
        , time = ( "10:10", "10:50" )
        }
    , TalkEntry
        { title = "Rewriting a Production SPA in Elm"
        , abstract = "You may have wondered: \"is rewriting my app to Elm worth it ?\". This talk will answer your question by following the story of how Frende ported an existing SPA to Elm. We'll look at how it was decided to go for Elm, how Elm fits into existing architecture, how it integrates with our tooling infrastructure, how our app was incrementally ported and deployed, how we got a whole team up and going Elm in no time, and much more."
        , speaker = david
        , time = ( "10:50", "11:10" )
        }
    , NonTalk "Break" ( "11:10", "11:20" )
    , TalkEntry
        { title = "Elm Editor Support - Perspectives From an Editor Hacker"
        , abstract = "Magnus started playing with Elm about a year and a half ago, and has since created elm-bootstrap in addition to the Elm plugin for the Light Table editor. In this talk, Magnus will give you an overview of where the editor/IDE support for Elm is currently at. He'll also share some reflections on what he believes is in the pipeline going forward."
        , speaker = magnus
        , time = ( "11:30", "10:50" )
        }
    , TalkEntry
        { title = "Everything in Elm"
        , abstract = "During my time at my own company, at NoRedInk, and in the open source community, I like to think I proved that anything that could be written in Javascript could also be written in Elm. This led to projects like take-home, the only full stack Elm application.\n\nIn this talk, we'll examine some of the things I've heard are \"impossible\" in Elm, such as: animation, inline-styles, writing CLI tools, writing a debugger, writing a server. We'll also discuss why some of these ideas are better off as unpublished packages, and the general problem-solving approach I take to making the unsolvable solved."
        , speaker = noah
        , time = ( "12:00", "12:20" )
        }
    , NonTalk "Break" ( "12:20", "12:40" )
    , TalkEntry
        { title = "Localization for Elm as a pre-build phase"
        , abstract = "Localization is usually done by providing a global dictionary function, passing the language to each view and keeping the current language in the app's model. This makes it difficult to add a second language to an existing code base and adds boiler plate code when 90% of the users will only care for one of the supported languages. Our concept is to have a small pre-build-phase to generate multiple single-language elm apps from the same code base."
        , speaker = felix
        , time = ( "12:45", "13:05" )
        }
    , TalkEntry
        { title = "An Elm Kernel for Jupyter"
        , abstract = "I'll introduce the Elm kernel for Jupyter notebooks. Jupyter (a.k.a. IPython) notebooks are a way to interleave text and executable code, and this new kernel allows you to embed Elm code in them. We'll look at how the kernel is implemented, I'll demonstrate how to use it, and hopefully participants will be inspired to use it or even contribute to the project. You can get the code for the project at github.com/abingham/jupyter-elm-kernel"
        , speaker = austin
        , time = ( "13:05", "13:25" )
        }
    , NonTalk "Lunch" ( "13:25", "14:10" )
    , TalkEntry
        { title = "Putting the Elm Platform in the Browser"
        , abstract = "I wanted it to be easier for folks to try the Elm platform and share it with each other, so I made Ellie and put it in the browser! Since its release in January of this year people have shared about 5000 revisions, but this is only the beginning. I want you all to share in my appreciation for this community and my desire for it to grow, so in this talk I'm going to share the life story of Ellie. You'll feel like you were there on the day it was first released, and share my own excitement about where it's heading now and what comes next."
        , speaker = luke
        , time = ( "14:10", "14:50" )
        }
    , NonTalk "Break" ( "14:50", "15:10" )
    , TalkEntry
        { title = "Move Fast and Don’t Break Things. Running a Startup on Elm"
        , abstract = "Are you concidering using Elm at your new fancy startup ? I did just this a year ago and now I'm coming to Oslo\nto talk about this \"crazy\" (read: great) decision and how it turned out. Was it a good experience ? Would I do the same again ? And – is Elm as good as they say ? Get the answer to these questions and many more in this talk."
        , speaker = nils
        , time = ( "15:10", "15:30" )
        }
    , TalkEntry
        { title = "Bootstrapping a project with Elm"
        , abstract = "At Blank we recently did a greenfield project that we knew would be frontend-heavy and whose a design and API would probably change many times, as we learned more. As if that wan't enough changes, the team would also see some rotation throughout the project.\nI will talk about why we thought Elm would be a good choice given the nature of the project, but most of all about our actual experience of using Elm with a team that, with one exception, had not used Elm before."
        , speaker = erlend
        , time = ( "15:30", "15:50" )
        }
    , NonTalk "Break" ( "15:50", "16:10" )
    , TalkEntry
        { title = "The Design Evolution of elm-css and elm-test"
        , abstract = "I've been fortunate to participate in the design of two popular projects, elm-css and elm-test. In the course of iterating on their designs with collaborators and community members, I've learned a lot about what worked well and what didn't. This talk will dive into the design decisions that shaped the past, present, and future of elm-css and elm-test. How did these projects balance build-time guarantees, performance, and user experience? What short-term sacrifices were deemed acceptable? What long-term invariants were considered worth preserving even under pressure? What's next for these libraries, and why? Come find out!"
        , speaker = richard
        , time = ( "16:10", "16:50" )
        }
    , NonTalk "Break" ( "17:00", "17:30" )
    , NonTalk "Dinner" ( "17:30", "19:00" )
    , NonTalkWithDesc "Panel" "With panelists Richard Feldman, Noah Hall, Luke Westby and local Elm community members, moderated by Brian Hicks." ( "19:00", "19:45" )
    , NonTalkWithDesc "Live band – Maraton" "Maraton is a local prog band from Oslo, currently finished up the work on their debut album to be released this fall." ( "20:30", "21:15" )
    ]
