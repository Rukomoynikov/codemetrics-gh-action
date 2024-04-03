rm .rubocop.yml

bundle exec rubocop -f json -o rubocop-report.json

echo "----------------"

echo $CODEMETRICS_TOKEN

echo "----------------"

echo $GITHUB_HEAD_REF

echo "----------------"

curl --location 'https://codemetrics.dev/reports' \
--form 'report=@"./rubocop-report.json"' \
--form 'tool="rubocop"' \
--form 'token="'"$CODEMETRICS_TOKEN"'"' \
--form 'branch="'"$GITHUB_HEAD_REF"'"'
