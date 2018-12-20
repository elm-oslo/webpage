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
    , { title = "All in on Elm for 18 months - an experience report from NSB!"
      , abstract = ""
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
      , abstract = ""
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
      , abstract = ""
      , speaker = Speakers.tessa
      , time = ( "", "" )
      }
    ]
