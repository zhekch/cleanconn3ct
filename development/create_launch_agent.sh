#!/bin/bash
set -e

APP_NAME="cleanconn3ct"
BINARY_NAME="cleanconn3ct"
DEPLOY_DIR="$(cd "$(dirname "$0")/../deploy" && pwd)"
BINARY_PATH="$DEPLOY_DIR/$BINARY_NAME"
PLIST_PATH="$DEPLOY_DIR/$APP_NAME.plist"

cat > "$PLIST_PATH" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$APP_NAME</string>
    <key>ProgramArguments</key>
    <array>
        <string>$BINARY_PATH</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
PLIST

echo "LaunchAgent plist written to $PLIST_PATH"
cat <<INSTRUCTIONS
To enable autostart on macOS run:
  cp "$PLIST_PATH" ~/Library/LaunchAgents/
  launchctl load ~/Library/LaunchAgents/$(basename "$PLIST_PATH")
INSTRUCTIONS

