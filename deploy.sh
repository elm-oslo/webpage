#/bin/bash

./build_elm.sh

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
elif [[ ${1} == "test" ]]; then
  BUCKET="elm-oslo-webpage-test"
else
  echo "Environment not recognized: '$1'."
  exit 1
fi

s3cmd --delete-removed --config=./.s3cfg sync site/ s3://${BUCKET}

curl -X POST \
-H 'Content-type: application/json' \
--data @<(cat <<EOF
{
  "text": "$(whoami) deployed to $1",
  "channel": "#webpage",
  "username": "Deploybot",
  "icon_url": "http://elm-lang.org/assets/logo.svg"
  }
EOF
) \
https://hooks.slack.com/services/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 \
>/dev/null 2>&1

echo "Deploy complete"