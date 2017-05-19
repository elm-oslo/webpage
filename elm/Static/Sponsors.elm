module Static.Sponsors exposing (..)

import Model exposing (Sponsor, SponsorTier(..))


all : List Sponsor
all =
    [ bekk
    , blank
    , kodemaker
    , iterate
    , knowit
    , arktekk
    , monokkel
    ]


bekk : Sponsor
bekk =
    { id = "bekk"
    , name = "Bekk"
    , url = "https://www.bekk.no"
    , imageUrl = "images/bekk_logo.svg"
    , tier = Gold
    }


blank : Sponsor
blank =
    { id = "blank"
    , name = "Blank"
    , url = "https://www.blank.no"
    , imageUrl = "images/blank_logo.svg"
    , tier = Gold
    }


kodemaker : Sponsor
kodemaker =
    { id = "kodemaker"
    , name = "Kodemaker"
    , url = "https://www.kodemaker.no"
    , imageUrl = "images/kodemaker_logo.svg"
    , tier = Gold
    }


iterate : Sponsor
iterate =
    { id = "iterate"
    , name = "Iterate"
    , url = "https://www.iterate.no"
    , imageUrl = "images/iterate.svg"
    , tier = Gold
    }


knowit : Sponsor
knowit =
    { id = "knowit"
    , name = "Knowit"
    , url = "https://www.knowit.no"
    , imageUrl = "images/knowit.svg"
    , tier = Gold
    }


arktekk : Sponsor
arktekk =
    { id = "arktekk"
    , name = "Arktekk"
    , url = "https://www.arktekk.no"
    , imageUrl = "images/arktekk.svg"
    , tier = Silver
    }


monokkel : Sponsor
monokkel =
    { id = "monokkel"
    , name = "Monokkel"
    , url = "https://www.monokkel.io"
    , imageUrl = "images/monokkel.svg"
    , tier = Silver
    }
