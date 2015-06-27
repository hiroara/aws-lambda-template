#!/bin/sh

set -e

DIR=$(dirname $0)/..
INPUT_JSON=${DIR}/tmp/update-function-code.json

source environment.sh
node ${DIR}/bin/filter-config.js ${DIR}/config.json FunctionName > ${INPUT_JSON}
gulp bundle
aws lambda update-function-code --cli-input-json file://${INPUT_JSON} --zip-file fileb://dist.zip
