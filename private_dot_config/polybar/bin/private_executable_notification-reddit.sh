#!/bin/sh

URL="https://www.reddit.com/message/unread/.json?feed=bc32fdcb4a67282ee7cac839c0a52083aadc79f0&user=alrayyes"
USERAGENT="polybar-scripts/notification-reddit:v1.0 u/reddituser"

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 0 ]; then
	echo "$notifications"
else
	echo ""
fi
