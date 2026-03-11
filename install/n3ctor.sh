#!/bin/bash

work_dir="$HOME/Library/Application Support/com.conn3ct"

killall Terminal
sed -i '' '$d' ~/.zsh_history

while true; do
    echo "$(date '+%Y-%m-%d %H:%M:%S')" > "$work_dir/timestamp.txt"
    sleep 10800
done
