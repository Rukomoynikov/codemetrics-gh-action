#!/bin/bash

if [ -n "$INPUT_WORKING_DIRECTORY" ]; then
    # Check if the directory specified by the environment variable exists
    if [ -d "$INPUT_WORKING_DIRECTORY" ]; then
        cd "$INPUT_WORKING_DIRECTORY"
        echo "Changed directory to: $INPUT_WORKING_DIRECTORY"
    else
        echo "Directory specified by 'INPUT_WORKING_DIRECTORY' does not exist: $INPUT_WORKING_DIRECTORY"
    fi
fi

rm .rubocop.yml

bundle exec rubocop -f json -o rubocop-report.json

curl --location 'https://codemetrics.dev/reports' \
--form 'report=@"./rubocop-report.json"' \
--form 'tool="rubocop"' \
--form 'token="'"$CODEMETRICS_TOKEN"'"' \
--form 'branch="'"$GITHUB_HEAD_REF"'"'
