module Static.Talks exposing (..)

import Model exposing (Talk)
import Static.Speakers as Speaker


all : List Talk
all =
    [ { title = "The Design Evolution of elm-css and elm-test"
      , abstract = "I've been fortunate to participate in the design of two popular projects, elm-css and elm-test. In the course of iterating on their designs with collaborators and community members, I've learned a lot about what worked well and what didn't. This talk will dive into the design decisions that shaped the past, present, and future of elm-css and elm-test. How did these projects balance build-time guarantees, performance, and user experience? What short-term sacrifices were deemed acceptable? What long-term invariants were considered worth preserving even under pressure? What's next for these libraries, and why? Come find out!"
      , speaker = Speaker.richard
      }
    , { title = "Putting the Elm Platform in the Browser"
      , abstract = "I wanted it to be easier for folks to try the Elm platform and share it with each other, so I made Ellie and put it in the browser! Since its release in January of this year people have shared about 5000 revisions, but this is only the beginning. I want you all to share in my appreciation for this community and my desire for it to grow, so in this talk I'm going to share the life story of Ellie. You'll feel like you were there on the day it was first released, and share my own excitement about where it's heading now and what comes next."
      , speaker = Speaker.luke
      }
    , { title = "Everything in Elm"
      , abstract = "During at my time at my own company, at NoRedInk, and in the open source community, I like to think I proved that anything that could be written in Javascript could also be written in Elm. This led to projects like take-home, the only full stack Elm application.\n\nIn this talk, we'll examine some of the things I've heard are \"impossible\" in Elm, such as: animation, inline-styles, writing CLI tools, writing a debugger, writing a server. We'll also discuss why some of these ideas are better off as unpublished packages, and the general problem-solving approach I take to making the unsolvable solved."
      , speaker = Speaker.noah
      }
    , { title = "The State of Elm 2017, Extended Edition"
      , abstract = "The State of Elm 2017 Survey is over and the results have been collected. Let’s look at them together! Where are new people in the community coming from? Where are they going? What’s great about Elm, and what could use improvement? In this talk, we’ll discuss these questions and what they mean for the Elm community at large."
      , speaker = Speaker.brian
      }
    , { title = "Rewriting a Production SPA in Elm"
      , abstract = "You may have wondered: \"is rewriting my app to Elm worth it ?\". This talk will answer your question by following the story of how Frende ported an existing SPA to Elm. We'll look at how it was decided to go for Elm, how Elm fits into existing architecture, how it integrates with our tooling infrastructure, how our app was incrementally ported and deployed, how we got a whole team up and going Elm in no time, and much more."
      , speaker = Speaker.david
      }
    , { title = "Elm Editor Support - Perspectives From an Editor Hacker"
      , abstract = "Magnus started playing with Elm about a year and a half ago, and has since created elm-bootstrap in addition to the Elm plugin for the Light Table editor. In this talk, Magnus will give you an overview of where the editor/IDE support for Elm is currently at. He'll also share some reflections on what he believes is in the pipeline going forward."
      , speaker = Speaker.magnus
      }
    , { title = "Localization for Elm as a pre-build phase"
      , abstract = "Localization is usually down by providing a global dictionary function and passing the language to each view and keeping the current language in the app's model. This makes it difficult to add a second language to an existing code base and adds boiler plate code when 90% of the user's will only care for one of the supported languages. Our concept is to have a small pre-build-phase to generate multiple single-language elm apps from the same code base. "
      , speaker = Speaker.felix
      }
    , { title = "Move Fast and Don’t Break Things. Running a Startup on Elm"
      , abstract = "Are you concidering using Elm at your new fancy startup ? I did just this a year ago and now I'm coming to Oslo\nto talk about this \"crazy\" (read: great) decision and how it turned out. Was it a good experience ? Would I do the same again ? And – is Elm as good as they say ? Get the answer to these questions and many more in this talk."
      , speaker = Speaker.nils
      }
    , { title = "Bootstrapping a project with Elm"
      , abstract = "At Blank we recently did a greenfield project that we knew would be frontend-heavy and whose a design and API would probably change many times, as we learned more. As if that wan't enough changes, the team would also see some rotation throughout the project.\nI will talk about why we thought Elm would be a good choice given the nature of the project, but most of all about our actual experience of using Elm with a team that, with one exception, had not used Elm before."
      , speaker = Speaker.erlend
      }
    , { title = "An Elm Kernel for Jupyter"
      , abstract = "I'll introduce the Elm kernel for Jupyter notebooks. Jupyter (a.k.a. IPython) notebooks are a way to interleave text and executable code, and this new kernel allows you to embed Elm code in them. We'll look at how the kernel is implemented, I'll demonstrate how to use it, and hopefully participants will be inspired to use it or even contribute to the project. You can get the code for the project at github.com/abingham/jupyter-elm-kernel"
      , speaker = Speaker.austin
      }
    ]
