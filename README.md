# osloelmday.no

## Development

Run the site using [elm-live](https://github.com/tomekwi/elm-live)

```shell
$ elm-live elm/Main.elm --dir=./site -- --output=./site/elm.js
```

## Prerequisites

Before you get started:

- Get an AWS user (talk to Kjetil or Erik)
- Install the `s3cmd` command. Available from `brew` on OSX, or see [the webpage](http://s3tools.org/s3cmd)
- Configure `s3cmd` with your credentials. (The deploy script expectes a `.s3cfg` file in the same folder.)

## Deploy

```
./deploy.sh prod
```
