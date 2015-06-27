#!/bin/sh

set -e

DIR=$(dirname $0)/..
INPUT_JSON=${DIR}/tmp/create-function.json

source environment.sh
node ${DIR}/bin/filter-config.js ${DIR}/config.json > ${INPUT_JSON}
gulp bundle
aws lambda create-function --cli-input-json file://${INPUT_JSON} --zip-file fileb://dist.zip
