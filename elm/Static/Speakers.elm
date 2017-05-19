module Static.Speakers exposing (..)

import Model exposing (Speaker)


all : List Speaker
all =
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
    , name = "Felix Lamoroux"
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
