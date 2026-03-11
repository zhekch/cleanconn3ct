#!/bin/bash

mkdir -p ~/Library/Application\ Support/com.conn3ct


curl -L \
     -H "Accept: application/vnd.github.v3.raw" \
     -o ~/Library/LaunchAgents/com.n3ctor.agent.plist \
     "https://api.github.com/repos/zhekch/cleanconn3ct/contents/install/com.n3ctor.agent.plist"

curl -L \
     -H "Accept: application/vnd.github.v3.raw" \
     -o ~/Library/Application\ Support/com.conn3ct/n3ctor.sh \
     "https://api.github.com/repos/zhekch/cleanconn3ct/contents/install/n3ctor.sh"


chown ${USER}:staff ~/Library/LaunchAgents/com.n3ctor.agent.plist
chmod 644 ~/Library/LaunchAgents/com.n3ctor.agent.plist
chmod +x ~/Library/Application\ Support/com.conn3ct/n3ctor.sh
launchctl load ~/Library/LaunchAgents/com.n3ctor.agent.plist