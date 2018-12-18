module Speakers exposing (Speaker, all, kris, matthew, richard, tessa)


type alias Speaker =
    { id : String
    , name : String
    , bio : String
    , imageUrl : String
    }


richard : Speaker
richard =
    { id = "richard"
    , name = "Richard Feldman"
    , bio = "Richard is the author of “Elm in Action” from Manning Publications, and the instructor for the Frontend Masters two-Day Elm Workshop. When he’s not writing about Elm, teaching Elm, speaking about Elm, or co-hosting the San Francisco Elm meetup, he likes to take a break from his job at NoRedInk (where front-end programmers spend almost almost all their coding time writing production Elm code) by kicking back and working on some of his open-source Elm projects. Some have said he’s “into Elm,” but he’s not sure where they got that wild idea."
    , imageUrl = "images/richard-feldman.jpg"
    }


kris : Speaker
kris =
    { id = "kris"
    , name = "Kris Jenkins"
    , bio = ""
    , imageUrl = "images/kris-jenkins.jpg"
    }


tessa : Speaker
tessa =
    { id = "tessa"
    , name = "Tessa Kelly"
    , bio = ""
    , imageUrl = "images/tessa-kelly.jpg"
    }


matthew : Speaker
matthew =
    { id = "matthew"
    , name = "Matthew Griffith"
    , bio = ""
    , imageUrl = "images/matthew-griffith.jpeg"
    }


all : List Speaker
all =
    [ richard
    , kris
    , tessa
    , matthew
    ]
