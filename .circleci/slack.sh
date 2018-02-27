#!/bin/bash

# Ex. bash .circleci/slack.sh

REPO_NAME=$CIRCLE_PROJECT_USERNAME'/'$CIRCLE_PROJECT_REPONAME
REPO_URL=$CIRCLE_REPOSITORY_URL
TAG=$CIRCLE_TAG
AUTHOR_NAME=$CIRCLE_PROJECT_USERNAME
AUTHOR_LINK="https//github.com/$CIRCLE_PROJECT_USERNAME"
AUTHOR_ICON="https//github.com/$CIRCLE_PROJECT_USERNAME.png"
RELEASE_NOTES=$(git log --format="%s" -n 1)

echo $AUTHOR_ICON

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
	  "title": "Released '$REPO_NAME' version '$TAG'",
	  "title_link": "'$REPO_URL'",
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