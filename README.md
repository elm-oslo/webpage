# osloelmday.no

## Prerequisites

Before you get started:

- Get an AWS user (talk to Kjetil or Erik)
- Install the `s3cmd` command. Available from `brew` on OSX, or see [the webpage](http://s3tools.org/s3cmd)
- Configure `s3cmd` with your credentials. (The deploy script expectes a `.s3cfg` file in the same folder.)

## Deploy

```
./deploy.sh prod
```
