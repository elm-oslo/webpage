# osloelmday.no
[![Build Status](https://travis-ci.org/elm-oslo/webpage.svg?branch=master)](https://travis-ci.org/elm-oslo/webpage)

## Development

Run the site using [elm-live](https://github.com/tomekwi/elm-live)

```shell
$ elm-live elm/Main.elm --dir=./site -- --output=./site/elm.js
```

## Deploy

The project uses Travis for continous integration. All commits to branches trigger a build to verify that the code works. If the build succeeds travis will procede to publish the code, either to [test](https://test.osloelmday.no/) or [production](https://osloelmday.no/). All branch builds will trigger deployment to test, only master builds will trigger a deployment to production. 
