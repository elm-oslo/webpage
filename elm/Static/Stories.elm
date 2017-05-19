module Static.Stories exposing (..)

import Model exposing (Story)
import Static.Sponsors as Sponsors


all : List Story
all =
    [ { sponsor = Sponsors.bekk
      , text = "BEKK syns at Elm er ganske stilig"
      }
    ]
