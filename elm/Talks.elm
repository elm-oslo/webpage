module Talks exposing (Slottime, Talk, all)

import Speakers exposing (Speaker)


type alias Slottime =
    ( String, String )


type alias Talk =
    { title : String
    , abstract : String
    , speaker : Speaker
    , time : Slottime
    }


all : List Talk
all =
    [ { title = "Slaying a UI Antipattern"
      , abstract = ""
      , speaker = Speakers.kris
      , time = ( "", "" )
      }
    , { title = "Lessons learned teaching Elm to kids"
      , abstract = ""
      , speaker = Speakers.teodor
      , time = ( "", "" )
      }
    , { title = "Exploring elm-spa-example"
      , abstract = ""
      , speaker = Speakers.richard
      , time = ( "", "" )
      }
    , { title = "Audio, Video, and Elm –\u{00A0}Best Practices for Multimedia"
      , abstract = ""
      , speaker = Speakers.dan
      , time = ( "", "" )
      }
    , { title = "A native interpreter for Elm"
      , abstract = ""
      , speaker = Speakers.filip
      , time = ( "", "" )
      }
    , { title = "A Markup for the Statically Typed"
      , abstract = ""
      , speaker = Speakers.matthew
      , time = ( "", "" )
      }
    , { title = "Picture combinators and recursive fish"
      , abstract = ""
      , speaker = Speakers.einar
      , time = ( "", "" )
      }
    , { title = "Joyful Particles in Elm"
      , abstract = ""
      , speaker = Speakers.brian
      , time = ( "", "" )
      }
    , { title = "Parsing lexical ambiguity with Elm and expressive types"
      , abstract = ""
      , speaker = Speakers.emma
      , time = ( "", "" )
      }
    , { title = "On the Elm Track with NSB"
      , abstract = """In 2017 NSB, one of Norways largest providers of public transport,
faced a situation where large and continuous changes to their young but already dated web platform were needed.The choice was made to move the code base to Elm, and now, one and a half year later, all the most critical parts of the platform is built in Elm.

In this talk I will share our team's experience from this process. I will talk about why we ended up building many medium sized applications instead of a large one and how we have created private libraries and a view-function library to reuse code between applications, boost our productivity and make the applications better.

Along the way I will share which things we have found to be simple thanks to Elm, and the pain points we have encountered."""
      , speaker = Speakers.jonas
      , time = ( "", "" )
      }
    , { title = "Emulating the Nintendo Game Boy CPU with Elm"
      , abstract = ""
      , speaker = Speakers.manuel
      , time = ( "", "" )
      }
    , { title = "Being human in the Elm community"
      , abstract = ""
      , speaker = Speakers.ossi
      , time = ( "", "" )
      }
    , { title = "Automated conference scheduling powered by Elm"
      , abstract = """Preparing an agenda for a big conference with many sessions and parallel tracks is extremely hard to do manually. NoConf is an automated agenda scheduler, which uses AI techniques to solve this problem. It has a frontend implemented in Elm and in this talk we will see how the decision to use Elm was a crucial factor of the transition from a small side project of a complete newbie in web programming into a real world application.

We will take a look at Elm’s learning curve. How it’s like to not have a JS background, or any web programming related knowledge for that matter, and still being able to face the challenge. Which pain points are most significant in this case and which advantages a non-web developer is getting from the start. How problems and solutions evolve along with project development and gained experience in Elm."""
      , speaker = Speakers.viktor
      , time = ( "", "" )
      }
    , { title = "Elm at large (companies)"
      , abstract = ""
      , speaker = Speakers.luca
      , time = ( "", "" )
      }
    , { title = "Do Parsers dream of Electric Guitars?"
      , abstract = ""
      , speaker = Speakers.ju
      , time = ( "", "" )
      }
    , { title = "The Extensibility Problem"
      , abstract = ""
      , speaker = Speakers.robin
      , time = ( "", "" )
      }
    , { title = "Tarring files with Elm"
      , abstract = ""
      , speaker = Speakers.james
      , time = ( "", "" )
      }
    , { title = "Color Coding with Elm"
      , abstract = "As we build out user interfaces, we make choices about color that involve us in a vivid history of experimentation and exploration. We benefit from the bountiful attention that painters, designers, physicists, biologists, doctors, mathematicians, makeup artists, and so many others have paid to studying color and its perception. Within our field as software engineers, we can be confident in the strengths of the color spaces we've defined, like RGB and HSL. However, we may also find that these color spaces, while they perfectly describe how we want our colors to render, don't actually reflect what we want our users to see. In this talk, we'll turn our gaze towards our users' perception of colors: how can we make palette choices that work for our users? My hope is that you leave this talk feeling excited about colors, and maybe even like your attitude toward them just slipped on a pair of rosy glasses."
      , speaker = Speakers.tessa
      , time = ( "", "" )
      }
    ]
