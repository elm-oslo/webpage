module Speakers exposing (Speaker, all, brian, dan, einar, emma, filip, james, jonas, ju, kris, luca, manuel, matthew, ossi, richard, robin, teodor, tessa, viktor)


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
    , bio = "Kris Jenkins is a contractor from London works in a mixture of Elm, Haskell & PureScript. He was one of the original organisers of Elm London and is best known to the Elm community as the author of RemoteData. In a former life he was the CTO and co-founder of the world’s largest online gold investment platform, BullionVault."
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


einar : Speaker
einar =
    { id = "einar"
    , name = "Einar W. Høst"
    , bio = "Einar W. Høst is a computer at NRK, the Norwegian public broadcaster. He thinks that programs should be written for people to read and also for machines to laugh at."
    , imageUrl = "images/einar-w-host.jpg"
    }


brian : Speaker
brian =
    { id = "brian"
    , name = "Brian Hicks"
    , bio = "Brian Hicks is the lead organizer of [elm-conf](https://www.elm-conf.us) and the author of [Mastering Elm: JSON Decoders](https://www.brianthicks.com/json-survival-kit/) and [elm-particle](https://github.com/BrianHicks/elm-particle/). He lives in St. Louis with his wife, son, and cat."
    , imageUrl = "images/brian-hicks.jpeg"
    }


manuel : Speaker
manuel =
    { id = "manuel"
    , name = "Manuel Fuchs"
    , bio = "Manuel is a functional programming enthusiast that recently got into Elm. Besides programming, he loves retro computers and games which led him to develop a Nintendo Game Boy Emulator in Elm, combining both interests. Professionally, he is the CTO of itravel, a German digital tour operator where he uses functional programming in both back- and frontend."
    , imageUrl = "images/manuel-fuchs.jpeg"
    }


robin : Speaker
robin =
    { id = "robin"
    , name = "Robin Heggelund Hansen"
    , bio = "Robin is a consultant with Bekk, where he spends his days writing Elm for NSB (a Norwegian train service). He has also contributed to Elm's core library with new implementations of Array, Dict and Set."
    , imageUrl = "images/robin-heggelund-hansen.jpg"
    }


james : Speaker
james =
    { id = "james"
    , name = "James (Jim) Carlson"
    , bio = "I am a retired research mathematician, working with Elm now for almost two years. Just love it! My main project is a library for parsing LaTeX and rendering it to HTML. See the MiniLatex section of https://jxxcarlson.github.io/."
    , imageUrl = "images/james-carlson.png"
    }


ossi : Speaker
ossi =
    { id = "ossi"
    , name = "Ossi Hanhinen"
    , bio = "Developer of user interfaces and a member of the Diversity and Inclusivity workforce at Futurice. Loves Elm and has used it in client projects from 2015."
    , imageUrl = "images/ossi-hanhinen.jpg"
    }


viktor : Speaker
viktor =
    { id = "viktor"
    , name = "Viktor Tymoshenko"
    , bio = "My journey with commercial software development has started in 2010. Since then, I've tried different roles: C++ developer, scrum master, product owner, founder. Combination of solid management experience and passion to FP has given birth to https://www.noconf.io, where I'm coding in Elm in my free time."
    , imageUrl = "images/viktor-tymoshenko.jpg"
    }


ju : Speaker
ju =
    { id = "ju"
    , name = "Ju Liu"
    , bio = "Ju was born in China, moved to Italy as a kid, grew up eating a lot of pasta, and started messing around with computers. He now lives in London and works for NoRedInk. He loves solving hard problems and building amazing products. When he’s not doing that, he’s probably rock climbing."
    , imageUrl = "images/ju-liu.jpg"
    }


luca : Speaker
luca =
    { id = "luca"
    , name = "Luca Mugnaini"
    , bio = "Engineer at Rakuten with a recent passion for Functional Programming. Originally from Italy, now living in Tokyo for several years."
    , imageUrl = "images/luca-mugnaini.jpg"
    }


emma : Speaker
emma =
    { id = "emma"
    , name = "Emma Tsujimoto Cunningham"
    , bio = "Emma Cunningham is a Los Angeles based senior software engineer. Prior to becoming a software engineer, Emma spent a decade as a theoretical linguist, focussing on building systems of logic for the study of natural language syntax and semantics. It was the study of expressive type systems that brought Emma to computer science and then software engineering. As a software engineer, Emma's interested in thinking about how to create highly scalable and maintainable systems, specifically with respect to systems that utilize and interact with high volumes of data."
    , imageUrl = "images/emma-tsujimoto-cunningham.png"
    }


jonas : Speaker
jonas =
    { id = "jonas"
    , name = "Jonas Berdal"
    , bio = "Jonas is one of the lucky developers who gets to work with Elm every day. He first fell in love with the language the summer of 2017, as a summer intern in the Norwegian consulting firm Bekk, where he now works as a developer. Besides coding Elm he spends his time flying back and forth between Oslo (where he works) and rainy Norwegian west coast town Bergen (where he lives). Bergen is also the town where he obtained his degrees in Programming Theory and Nanotechnology."
    , imageUrl = "images/jonas-berdal.jpeg"
    }


dan : Speaker
dan =
    { id = "dan"
    , name = "Dan Abrams"
    , bio = """Dan spent the past decade and a half making films, tv, and commercials. He runs a NYC-area video production business which makes live streams and videos for large brands. But he doesn't just make the videos, but also video players and platforms, often using Elm.

He will be finishing a batch at Recurse Center the day before Oslo Elm Day and has decided he wants to put video making aside and focus full time on development (and live streaming)."""
    , imageUrl = "images/dan-abrams.jpg"
    }


filip : Speaker
filip =
    { id = "filip"
    , name = "Filip Haglund"
    , bio = "Filip is a lead developer at Concordium, where the team develops an Elm-like language for use in finance, an elm-test contributor, and a strong believer in correctness being the most important feature of any system."
    , imageUrl = "images/filip-haglund.jpeg"
    }


teodor : Speaker
teodor =
    { id = "teodor"
    , name = "Teodor Lunaas Heggelund"
    , bio = "With an interdisciplinary background in computer science, structural engineering and teaching, Teodor is currently responsible for the technology development in Pure Logic, a start-up aiming to improve descision making by using stochastic models. He is also working with NTNU's department of Structural Engineering's to aid their efforts to digitize their engineering courses. Since 2016, Teodor has volunteered with Teach Kids Code (Lær Kidsa Koding), teaching children how to create with technology in code clubs. After guiding the Web course (HTML, CSS and JavaScript), Teodor took initiative to bring Elm into Oslo Code Club."
    , imageUrl = "images/teodor-lunaas-heggelund.png"
    }


all : List Speaker
all =
    [ richard
    , kris
    , tessa
    , matthew
    , einar
    , brian
    , manuel
    , robin
    , james
    , ossi
    , viktor
    , ju
    , luca
    , emma
    , jonas
    , dan
    , filip
    , teodor
    ]
