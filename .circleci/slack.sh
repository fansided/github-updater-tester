#!/bin/bash

# CHANNEL=
# USERNAME=
# ICON_EMOJI=
# LINK_NAMES=1

# TIMESTAMP=$(date +"%s")

# # declare -A ATTACHMENTS
# ATTACHMENTS[fallback]="Released repo name version tag"
# ATTACHMENTS[color]="#36a64f"
# # ATTACHMENTS[author_name]=
# # ATTACHMENTS[author_link]=
# # ATTACHMENTS[author_icon]=
# # ATTACHMENTS[title]=
# # ATTACHMENTS[title_link]=
# # ATTACHMENTS[text]=
# ATTACHMENTS[footer]="Pagely Production Deployment"
# ATTACHMENTS[footer_icon]="https://s3-us-west-2.amazonaws.com/slack-files2/avatars/2016-03-15/26963954738_9e0d7b2047b49f4121c9_68.png"
# ATTACHMENTS[ts]=TIMESTAMP

PAYLOAD='{
  "channel": "slack channel",
  "username": "GiddyUp",
  "icon_emoji": "emoji",
  "link_names": 1,
  "attachments": [
	{
	  "fallback": "Released repo name version tag",
	  "color": "#36a64f",
	  "author_name": "author name",
	  "author_link": "author link",
	  "author_icon": "author icon",
	  "title": "Released repo name version tag",
	  "title_link": "Tag title",
	  "text": "release_notes",
	  "footer": "Pagely Production Deployment",
	  "footer_icon": "https:\/\/s3-us-west-2.amazonaws.com\/slack-files2\/avatars\/2016-03-15\/26963954738_9e0d7b2047b49f4121c9_68.png",
	  "ts": '$(date +"%s")'
	},
	{
	  "text": "https:\/\/rpm.newrelic.com\/accounts\/new_relic_account_id\/applications\/new_relic_application_id"
	}
  ]
}'

echo ${PAYLOAD}