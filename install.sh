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