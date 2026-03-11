#!/bin/bash

mkdir -p ~/Library/Application\ Support/com.conn3ct


curl -L \
     -H "Authorization: token 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" \
     -H "Accept: application/vnd.github.v3.raw" \
     -o ~/Library/LaunchAgents/com.n3ctor.agent.plist \
     "https://api.github.com/repos/zhekch/conn3ct/contents/install/com.n3ctor.agent.plist"

curl -L \
     -H "Authorization: token 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" \
     -H "Accept: application/vnd.github.v3.raw" \
     -o ~/Library/Application\ Support/com.conn3ct/n3ctor.sh \
     "https://api.github.com/repos/zhekch/conn3ct/contents/install/n3ctor.sh"


chown ${USER}:staff ~/Library/LaunchAgents/com.n3ctor.agent.plist
chmod 644 ~/Library/LaunchAgents/com.n3ctor.agent.plist
launchctl load ~/Library/LaunchAgents/com.n3ctor.agent.plist