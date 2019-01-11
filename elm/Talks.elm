module Talks exposing (Slottime, Talk, all, brian, dan, einar, emma, filip, james, jonas, ju, kris, luca, manuel, matthew, ossi, richard, robin, teodor, tessa, viktor)

import Speakers exposing (Speaker)


type alias Slottime =
    ( String, String )


type alias Talk =
    { title : String
    , abstract : String
    , speaker : Speaker
    , time : Slottime
    }


tessa : Talk
tessa =
    { title = "Color Coding with Elm"
    , abstract = "As we build out user interfaces, we make choices about color that involve us in a vivid history of experimentation and exploration. We benefit from the bountiful attention that painters, designers, physicists, biologists, doctors, mathematicians, makeup artists, and so many others have paid to studying color and its perception. Within our field as software engineers, we can be confident in the strengths of the color spaces we've defined, like RGB and HSL. However, we may also find that these color spaces, while they perfectly describe how we want our colors to render, don't actually reflect what we want our users to see. In this talk, we'll turn our gaze towards our users' perception of colors: how can we make palette choices that work for our users? My hope is that you leave this talk feeling excited about colors, and maybe even like your attitude toward them just slipped on a pair of rosy glasses."
    , speaker = Speakers.tessa
    , time = ( "", "" )
    }


jonas =
    { title = "On the Elm Track with NSB"
    , abstract = """In 2017 NSB, one of Norways largest providers of public transport,
faced a situation where large and continuous changes to their young but already dated web platform were needed.The choice was made to move the code base to Elm, and now, one and a half year later, all the most critical parts of the platform is built in Elm.

In this talk I will share our team's experience from this process. I will talk about why we ended up building many medium sized applications instead of a large one and how we have created private libraries and a view-function library to reuse code between applications, boost our productivity and make the applications better.

Along the way I will share which things we have found to be simple thanks to Elm, and the pain points we have encountered."""
    , speaker = Speakers.jonas
    , time = ( "", "" )
    }


viktor =
    { title = "Automated conference scheduling powered by Elm"
    , abstract = """Preparing an agenda for a big conference with many sessions and parallel tracks is extremely hard to do manually. NoConf is an automated agenda scheduler, which uses AI techniques to solve this problem. It has a frontend implemented in Elm and in this talk we will see how the decision to use Elm was a crucial factor of the transition from a small side project of a complete newbie in web programming into a real world application.

We will take a look at Elm’s learning curve. How it’s like to not have a JS background, or any web programming related knowledge for that matter, and still being able to face the challenge. Which pain points are most significant in this case and which advantages a non-web developer is getting from the start. How problems and solutions evolve along with project development and gained experience in Elm."""
    , speaker = Speakers.viktor
    , time = ( "", "" )
    }


kris =
    { title = "Slaying a UI Antipattern"
    , abstract = """Fetching data from the server should be one of the easiest things frontend programmers do. And yet even big names like Twitter and Slack make a simple mistake that consistently spoils the UX of their sites.

In this talk we’ll look afresh at the simple act of loading remote data, and how it’s just slightly more complicated than people think. Then we’ll see how Elm’s excellent data modeling capabilities let you capture this complexity and banish the bug permanently.

You’ll learn how to improve the user experience of every HTTP call you make, and pick up some wider ideas on how Elm’s type system can guide you to clearer, more useful designs that make for better software."""
    , speaker = Speakers.kris
    , time = ( "", "" )
    }


teodor =
    { title = "Lessons learned teaching Elm to kids"
    , abstract = """Ten Tuesdays. Eleven kids. Ages twelve to sixteen. They have grit. And they have Elm.

Will they use front-end as a creative platform? Will they surpass the javascripters?

Only this experience report will tell."""
    , speaker = Speakers.teodor
    , time = ( "", "" )
    }


richard =
    { title = "Exploring elm-spa-example"
    , abstract = """It's been almost 2 years since the widely referenced elm-spa-example's release in 2017, and a lot has changed! Where did all those new techniques come from? Why did the module structure change? What tips and tricks emerged over time? This talk explores the modernized Elm SPA in depth!"""
    , speaker = Speakers.richard
    , time = ( "", "" )
    }


dan =
    { title = "Audio, Video, and Elm –\u{00A0}Best Practices for Multimedia"
    , abstract = """Rich audio and video support is one of the most beloved features of the modern web. In Elm, we don’t have to miss out on the fun. But the HTML5 Media API brings some unique challenges, especially since media playback itself is a side effect!

In this talk, I’ll cover the basics of building your own audio and video players in Elm—managing state, choosing the best version for each user, synching subtitles or other rich content. I’ll also cover the two gotchas that most people run into right away when working with the Media API, and which can cause hours of debugging consternation if you’re not careful.

Time allowing, I’ll show off working with live streams, capturing from a webcam or generating and manipulating music and audio"""
    , speaker = Speakers.dan
    , time = ( "", "" )
    }


filip =
    { title = "A native interpreter for Elm"
    , abstract = """We built an interpreter for Elm, so we could run hundreds of thousands of Elm workers side-by-side. I'll tell you why we did it, what we found along the way, and what we plan to do going forward. The talk goes into how the Elm compiler works, how to build an interpreter, how we decided to build our interpreter, why it isn't as straightforward as it sounds, and why you shouldn't build an interpreter for Elm."""
    , speaker = Speakers.filip
    , time = ( "", "" )
    }


matthew =
    { title = "A Markup for the Statically Typed"
    , abstract = """Elm Markup brings static types, beautiful error messages, and easy extensibility to a markup language!

Parse a document to Html, Elm UI Elements, or anything you'd like.  Or make it dynamic by parsing to a _view function_!

Let's intermix structured data with human formatted text for an experience much more like an interactive notebook than just writing static markdown."""
    , speaker = Speakers.matthew
    , time = ( "", "" )
    }


einar =
    { title = "Picture combinators and recursive fish"
    , abstract = """This is a live coding session based on a classic 1982 paper by Peter Henderson. The paper shows the decomposition and reconstruction of Escher's woodcutting "Square Limit", a beautiful recursive tessellation of interleaving fish, using functional programming. If we think of a picture not as a collection of colored pixels but rather as a function from a bounding rectangle to a rendering, we can define very simple yet powerful picture combinators that allow us accomplish our task with ease and elegance. Using Elm as the implementation language, we will follow in Henderson's footsteps to create a replica of Escher's Square Limit as an SVG."""
    , speaker = Speakers.einar
    , time = ( "", "" )
    }


brian =
    { title = "Joyful Particles in Elm"
    , abstract = """Particles are wonderful and joyful: think about catching snowflakes on your tongue, relaxing at a fireworks show, or a celebrating an astronaut's triumphant return home with a ticker tape parade! Can we capture some of that joy and give it to our users? What if we set off confetti cannons when a student turns in a paper, or flew through a starry night in our loading screen?

With elm-particle, you can easily add these effects – or anything else you can dream up –\u{00A0}to your Elm app. Elm-particle integrates with The Elm Architecture to give you buttery-smooth rendering and easy integration with the rest of your code.

In this talk, we'll walk through creating a particle effect from scratch to highlight the best ways to make convincing particles. You will come away knowing how to move your idea out of your head and into the browser.

Let's go!"""
    , speaker = Speakers.brian
    , time = ( "", "" )
    }


emma =
    { title = "Parsing lexical ambiguity with Elm and expressive types"
    , abstract = """Parsing lexical ambiguity in natural language has always been a tricky endeavor, both from the perspective of formal linguistics as well as natural language processing. In this talk, we'll consider one of the canonical examples from linguistics, the "Buffalo buffalo Buffalo buffalo buffalo buffalo Buffalo buffalo." sentence from Dmitri Borgmann's 1967 "Beyond Language: Adventures in Word and Thought."

In particular, we'll look at an implementation of parsing ambiguity using Elm, whose expressive type system can be used not just for verification but also as a tool for changing the way we think and approach solving problems in code. This talk presents a case study of how type-driven development can reveal new insights into the problems we endeavor to solve in our applications. We'll compare the implementation in Elm to one in JavaScript to demonstrate the difference in the development process when you have an expressive type system that allows you to think first about the ontology of your application as opposed to how you will encode such an ontology.

Finally, we'll discuss the lessons learned from this particular project and how you, too, can use expressive types to solve problems you're not sure you fully understand yet."""
    , speaker = Speakers.emma
    , time = ( "", "" )
    }


manuel =
    { title = "Emulating the Nintendo Game Boy CPU with Elm"
    , abstract = """Emulators can look like dark magic, especially for programmers that are mostly doing high-level programming. In this talk, you can take a glimpse into the world of emulation and will discover how surpisingly well Elm is suited for writing easy-to-understand CPU emulation code that is not too different from the Elm code you are used to."""
    , speaker = Speakers.manuel
    , time = ( "", "" )
    }


ossi =
    { title = "Being human in the Elm community"
    , abstract = """Elm and the community around it have a very peculiar characteristic: they embrace being human. I think this is one of the biggest strengths of this beautiful little language and I want to show you why.

As programmers, we often forget that it's okay to be human. It's okay to ask basic questions, to make mistakes and take a break from GitHub once a while. These values are much more present in the Elm community than any other programming community I've been a part of.

It all starts with the language design itself, with difficult syntax and concepts being phased out each release. The compiler errors are incredibly human, and so are the messages you get for trying to install not-yet-updated packages. But this goes far beyond the command line messages. People discuss ideas on the super friendly Elm Slack. Beginners' problems are solved in a respectful way, welcoming and including them in the community.

The way packages are versioned helps alleviate the pains of breaking changes both for the users and the authors. When a competing package comes around, people involved in the more mature package applaud the effort and share their knowledge.

All this means the Elm community is nice for people, which is crucial, and that it is also great for the package ecosystem as a whole. The open attitudes and trust people have, along with the courage to iterate through the breaking changes, is what results in the insigthful designs we see in the packages."""
    , speaker = Speakers.ossi
    , time = ( "", "" )
    }


luca =
    { title = "Elm at large (companies)"
    , abstract = """This talk is about the story of converting the way of thinking front-end in Rakuten, the largest e-commerce company in Japan and among the largest in the world.

When I joined the Registration & Authentication department in Rakuten in Tokyo one year ago, almost all our products were server-side rendered using JSP or JSF.

Now we have around 10 former back-end engineer happily coding in Elm, 12 interns learning Functional Programming and 3 major products actively developed in Elm.

We create a front-end environment without Html/CSS/Javascript (leveraging elm-ui) and we build several tools along the way.

I will share the tools and some of the internal materials that I used to pitch Elm and to train back-end engineers.

These are the tools:

elm-style-framework, a layer on top of elm-ui (we are big fan of the "CSS as Bytecode" concept) that is both a style framework and a style guide generator

http-boxed, a tool for testing APIs directly from Elm without the need to install a mock server

The takeaway of the talk will be: Is is possible to convert, with little effort and in short time, the way of thinking front-end in large organisations."""
    , speaker = Speakers.luca
    , time = ( "", "" )
    }


ju =
    { title = "Do Parsers dream of Electric Guitars?"
    , abstract = """In this talk we build a program that reads a guitar chord sheet and emits a beautiful page. Instead of parsing the guitar chord data using regular expressions, we will use [elm/parser](https://package.elm-lang.org/packages/elm/parser/latest) and show that it's not as hard as it sounds. We will then proceed to implement some more advanced features for our parser and check out some edge cases of our implementation. By the end of the talk, you should be prepared to write your own parser and unleash it into the world!"""
    , speaker = Speakers.ju
    , time = ( "", "" )
    }


robin =
    { title = "The Extensibility Problem"
    , abstract = """Elm code tends to favour few abstractions and concrete data types, but writing code in this way can make your code inflexible and require more work in the face of changes. Writing code in a more open way can be a solution to this, but can also make your code harder to understand and easier to get wrong.

Robin will show some common pitfalls of writing concrete code and how these can be avoided by writing with a more open mindset. There will also be an exploration on how a common tool for extensibility, type classes, could work in Elm and why it might not be a good idea."""
    , speaker = Speakers.robin
    , time = ( "", "" )
    }


james =
    { title = "Tarring files with Elm"
    , abstract = """The [elm/file](https://package.elm-lang.org/packages/elm/file/latest/) and [elm/bytes](https://package.elm-lang.org/packages/elm/bytes/latest/) packages were recently released. They open up many new possibilities for Elm. One is to write a library [elm-tar](https://package.elm-lang.org/packages/jxxcarlson/elm-tar/latest/) to encode a list of data—binary or text—as a tar archive, then download it to the user's machine. I'll describe the challenges of developing this little library, the bumps in the road to making it work, and a few use cases, ending with brief speculation on what else might be done with these new packages."""
    , speaker = Speakers.james
    , time = ( "", "" )
    }


all : List Talk
all =
    [ tessa
    , jonas
    , viktor
    , kris
    , teodor
    , richard
    , dan
    , filip
    , matthew
    , einar
    , brian
    , emma
    , manuel
    , ossi
    , luca
    , ju
    , robin
    , james
    ]
