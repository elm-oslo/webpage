module Model
    exposing
        ( Model
        , Msg(..)
        , Page(..)
        , Sponsor
        , SponsorTier(..)
        , Speaker
        , ScheduleEntry(..)
        , sponsors
        , speakers
        , scheduleEntries
        )

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
    | TicketButtonMouseEnter
    | TicketButtonMouseLeave
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
    , { name = "eggs"
      , url = "https://eggsdesign.no"
      , imageUrl = "images/eggs_logo.svg"
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
    , { name = "webstep"
      , url = "https://www.webstep.no"
      , imageUrl = "images/webstep.svg"
      , tier = Silver
      }
    , { name = "sixtynorth"
      , url = "https://www.sixty-north.com"
      , imageUrl = "images/sixtynorth.svg"
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
    , bio = "Brian Hicks is the CTO of Asteris, a devops consultancy based in St. Louis, MO. He organizes elm-conf US, blogs about Elm (and other things) at brianthicks.com and runs the St. Louis Tech Slack. He enjoys biking around St. Louis, hanging out with his wife, and tweeting about his cat."
    , imageUrl = "images/brianhicks.png"
    }


felix : Speaker
felix =
    { id = "felix"
    , name = "Felix Lamouroux"
    , bio = "Founder of iosphere GmbH a small mobile development agency based in Cologne Germany working on native mobile and mobile web and desktop applications."
    , imageUrl = "images/felix2.png"
    }


david : Speaker
david =
    { id = "david"
    , name = "David Ed Mellum"
    , bio = "David is a software developer at Frende Forsikring with a love for simple and obvious problem solving. He's also a speaker at meetups and conferences and helps organize the Booster Conference and Elm user group Bergen."
    , imageUrl = "images/davidmellum.jpg"
    }


nils : Speaker
nils =
    { id = "nils"
    , name = "Nils Eriksson"
    , bio = "Nils Eriksson was part of a startup in Sweden that at the time built the worlds second largest Elm application."
    , imageUrl = "images/nilseriksson.jpg"
    }


erlend : Speaker
erlend =
    { id = "erlend"
    , name = "Erlend Hamberg"
    , bio = "Erlend started a on computer engineering degree to learn about systems programming and hardware, but veered slightly off course and ended up with a degree in computer science with a specialization in artificial intelligence. His background is mostly Erlang and Haskell, but the last year he has also made some forays into frontend programming, trying various languages and stacks, with Elm ending up as his favourite."
    , imageUrl = "images/erlend2.png"
    }


magnus : Speaker
magnus =
    { id = "magnus"
    , name = "Magnus Rundberget"
    , bio = "Magnus works as a consultant for Kodemaker. He started looking at Elm 1.5 years ago and decided to learn it by writing an Elm plugin for the Light Table Editor. He's spent countless evenings and nights writing editor stuff in ClojureScript/JavaScript and Elm in an attempt to provide decent IDE-like support for Elm. Magnus has also created the Elm Bootstrap library and is fond of blogging when time permits. When he started looking at Elm, he felt a bit like a lone werdo her in Norway. Now he's super stoked about the fact that we have a vibrant and rapidly growing Elm Community and our very own conference."
    , imageUrl = "images/magnusrundberget.jpg"
    }


austin : Speaker
austin =
    { id = "austin"
    , name = "Austin Bingham"
    , bio = "Austin is a founding director of Sixty North, a software consulting, training, and application development company. A native of Texas, in 2008 Austin moved to Stavanger, Norway where he helped develop industry-leading oil reservoir modeling software. Prior to that he worked at National Instruments, at Applied Research Labs developing sonar systems, and at several telecommunications companies. He is an experienced presenter, teacher, and author, and is an active member of the open source community. He’s the founder of Stavanger Software Developers, a social software group in Stavanger. Austin holds a MSc in Computer Engineering from the University of Texas at Austin."
    , imageUrl = "images/austin3.png"
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
    , austin
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
        , time = ( "11:55", "12:15" )
        }
    , NonTalk "Break" ( "12:15", "12:35" )
    , TalkEntry
        { title = "Localization for Elm as a pre-build phase"
        , abstract = "Localization is usually done by providing a global dictionary function, passing the language to each view and keeping the current language in the app's model. This makes it difficult to add a second language to an existing code base and adds boiler plate code when 90% of the users will only care for one of the supported languages. Our concept is to have a small pre-build-phase to generate multiple single-language elm apps from the same code base."
        , speaker = felix
        , time = ( "12:35", "12:55" )
        }
    , TalkEntry
        { title = "An Elm Kernel for Jupyter"
        , abstract = "I'll introduce the Elm kernel for Jupyter notebooks. Jupyter (a.k.a. IPython) notebooks are a way to interleave text and executable code, and this new kernel allows you to embed Elm code in them. We'll look at how the kernel is implemented, I'll demonstrate how to use it, and hopefully participants will be inspired to use it or even contribute to the project. You can get the code for the project at github.com/abingham/jupyter-elm-kernel"
        , speaker = austin
        , time = ( "12:55", "13:15" )
        }
    , NonTalk "Lunch" ( "13:15", "14:00" )
    , TalkEntry
        { title = "Putting the Elm Platform in the Browser"
        , abstract = "I wanted it to be easier for folks to try the Elm platform and share it with each other, so I made Ellie and put it in the browser! Since its release in January of this year people have shared about 5000 revisions, but this is only the beginning. I want you all to share in my appreciation for this community and my desire for it to grow, so in this talk I'm going to share the life story of Ellie. You'll feel like you were there on the day it was first released, and share my own excitement about where it's heading now and what comes next."
        , speaker = luke
        , time = ( "14:00", "14:40" )
        }
    , NonTalk "Break" ( "14:40", "15:00" )
    , TalkEntry
        { title = "Move Fast and Don’t Break Things. Running a Startup on Elm"
        , abstract = "Are you concidering using Elm at your new fancy startup ? I did just this a year ago and now I'm coming to Oslo\nto talk about this \"crazy\" (read: great) decision and how it turned out. Was it a good experience ? Would I do the same again ? And – is Elm as good as they say ? Get the answer to these questions and many more in this talk."
        , speaker = nils
        , time = ( "15:00", "15:20" )
        }
    , TalkEntry
        { title = "Bootstrapping a project with Elm"
        , abstract = "At Blank we recently did a greenfield project that we knew would be frontend-heavy and whose a design and API would probably change many times, as we learned more. As if that wan't enough changes, the team would also see some rotation throughout the project.\nI will talk about why we thought Elm would be a good choice given the nature of the project, but most of all about our actual experience of using Elm with a team that, with one exception, had not used Elm before."
        , speaker = erlend
        , time = ( "15:20", "15:40" )
        }
    , NonTalk "Break" ( "15:40", "16:00" )
    , TalkEntry
        { title = "The Design Evolution of elm-css and elm-test"
        , abstract = "I've been fortunate to participate in the design of two popular projects, elm-css and elm-test. In the course of iterating on their designs with collaborators and community members, I've learned a lot about what worked well and what didn't. This talk will dive into the design decisions that shaped the past, present, and future of elm-css and elm-test. How did these projects balance build-time guarantees, performance, and user experience? What short-term sacrifices were deemed acceptable? What long-term invariants were considered worth preserving even under pressure? What's next for these libraries, and why? Come find out!"
        , speaker = richard
        , time = ( "16:00", "16:40" )
        }
    , NonTalk "Break" ( "17:00", "17:30" )
    , NonTalk "Dinner" ( "17:30", "19:00" )
    , NonTalkWithDesc "Panel" "With panelists Richard Feldman, Noah Hall, Luke Westby and local Elm community members, moderated by Brian Hicks." ( "19:00", "19:45" )
    , NonTalkWithDesc "Live band – Maraton" "Maraton is a local prog band from Oslo, currently finished up the work on their debut album to be released this fall." ( "20:30", "21:15" )
    ]
