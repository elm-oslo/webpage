#!/bin/bash

elm-package install --yes
elm-make elm/Main.elm --output site/elm.js