#/bin/bash

BASEDIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
while [ -h "$BASEDIR/$0" ]; do
    DIR=$(dirname -- "$BASEDIR/$0")
    SYM=$(readlink $BASEDIR/$0)
    BASEDIR=$(cd $DIR && cd $(dirname -- "$SYM") && pwd)
done
cd ${BASEDIR}

if [[ "$#" != "1" ]]; then
  echo "Usage: ${0} <environment>"
  exit 1
elif [[ ${1} == "prod" ]]; then
  BUCKET="elm-oslo-webpage"
else
  echo "Environment not recognized: '$1'."
  exit 1
fi

s3cmd --delete-removed --config=./.s3cfg sync site/ s3://${BUCKET}
