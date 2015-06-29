#!/bin/sh

set -e

DIR=$(dirname $0)/..
INPUT_JSON=${DIR}/tmp/update-function-configuration.json

source environment.sh
node ${DIR}/bin/filter-config.js ${DIR}/config.json FunctionName Role Handler Description Timeout MemorySize > ${INPUT_JSON}
aws lambda update-function-configuration --cli-input-json file://${INPUT_JSON}
