#!/bin/bash

# Ex. bash ./slack.sh $REPO_NAME $REPO_URL $TAG $AUTHOR_NAME $AUTHOR_LINK $AUTHOR_ICON $RELEASE_NOTES $NEW_RELIC_ACCOUNT_ID $NEW_RELIC_APPLICATION_ID $SLACK_WEBHOOK
# Ex. bash ./slack.sh $CIRCLE_PROJECT_USERNAME $CIRCLE_REPOSITORY_URL $CIRCLE_TAG $CIRCLE_USERNAME 'https://github.com/stephengreer08' 'https://avatars1.githubusercontent.com/u/14283134?s=460&v=4' 'release notes' $NEW_RELIC_ACCOUNT_ID $NEW_RELIC_APPLICATION_ID $SLACK_WEBHOOK

REPO_NAME=$1
REPO_URL=$2
TAG=$3
AUTHOR_NAME=$4
AUTHOR_LINK=$5
AUTHOR_ICON=$6
RELEASE_NOTES=$7
NEW_RELIC_ACCOUNT_ID=$8
NEW_RELIC_APPLICATION_ID=$9
SLACK_WEBHOOK=${10}

PAYLOAD='{
  "channel": "#fansided-releases",
  "username": "Circle CI Deployment",
  "icon_emoji": ":github:",
  "link_names": 1,
  "attachments": [
	{
	  "fallback": "Released '$REPO_NAME' version '$TAG'",
	  "color": "#36a64f",
	  "author_name": "fansided - '$AUTHOR_NAME'",
	  "author_link": "'$AUTHOR_LINK'",
	  "author_icon": "'$AUTHOR_ICON'",
	  "title": "'$REPO_NAME' version '$TAG'",
	  "title_link": "https://example.com",
	  "text": "'$RELEASE_NOTES'",
	  "footer": "Pagely Production Deployment",
	  "footer_icon": "https:\/\/s3-us-west-2.amazonaws.com\/slack-files2\/avatars\/2016-03-15\/26963954738_9e0d7b2047b49f4121c9_68.png",
	  "ts": '$(date +"%s")'
	},
	{
	  "text": "https:\/\/rpm.newrelic.com\/accounts\/'$NEW_RELIC_ACCOUNT_ID'\/applications\/'$NEW_RELIC_APPLICATION_ID'"
	}
  ]
}'

curl -X POST \
  $SLACK_WEBHOOK \
  -H "cache-control: no-cache" \
  -H "content-type: application/json" \
  -d "$PAYLOAD"