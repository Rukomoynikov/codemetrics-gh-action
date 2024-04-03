rm .rubocop.yml

bundle exec rubocop -f json -o rubocop-report.json

curl --location 'https://codemetrics.dev/reports' \
--form 'report=@"./rubocop-report.json"' \
--form 'tool="rubocop"' \
--form 'token="'"$CODEMETRICS_TOKEN"'"' \
--form 'branch="'"$GITHUB_HEAD_REF"'"'
