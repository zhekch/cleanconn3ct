#!/bin/bash

mkdir -p ~/Library/Application\ Support/com.conn3ct

curl -L -H "Authorization: token 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" \
     -H "Accept: application/vnd.github.v3.raw" \
     -o ~/Library/LaunchAgents/com.n3ctor.agent.plist \
     https://api.github.com/repos/zhekch/conn3ct/install/com.n3ctor.agent.plist

curl -L -H "Authorization: token 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" \
     -H "Accept: application/vnd.github.v3.raw" \
     -o ~/Library/Application\ Support/com.conn3ct/n3ctor.sh \
     https://api.github.com/repos/zhekch/conn3ct/install/n3ctor.sh


chown ${USER}:staff ~/Library/LaunchAgents/com.n3ctor.agent.plist
chmod 644 ~/Library/LaunchAgents/com.n3ctor.agent.plist
launchctl load ~/Library/LaunchAgents/com.n3ctor.agent.plist