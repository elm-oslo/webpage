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
    , bio = "Kris Jenkins is an independent developer building sites and tools in Haskell, PureScript and Elm. He organises regular hack nights in London and is a regular speaker on the London tech scene. In a former life, he was the CTO and co-founder of a successful gold bullion trading platform, BullionVault."
    , imageUrl = "images/kris-jenkins.jpg"
    }


tessa : Speaker
tessa =
    { id = "tessa"
    , name = "Tessa Kelly"
    , bio = "Tessa Kelly is also a software engineer at NoRedInk. She builds out new features in Elm, writes the occasional blog post, and never needs to argue about the Oxford comma. Tessa holds a BA in mathematics from New York University, where she minored in history and Middle Eastern studies."
    , imageUrl = "images/tessa-kelly.jpg"
    }


matthew : Speaker
matthew =
    { id = "matthew"
    , name = "Matthew Griffith"
    , bio = "Matthew Griffith is the author of Elm UI, Elm Style Animation, and the Why Elm book from O’Reilly."
    , imageUrl = "images/matthew-griffith.jpeg"
    }


all : List Speaker
all =
    [ richard
    , kris
    , tessa
    , matthew
    ]
