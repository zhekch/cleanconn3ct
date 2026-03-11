#!/bin/bash

work_dir="~/Library/Application\ Support/com.conn3ct"

while true; do
    echo "$(date '+%Y-%m-%d %H:%M:%S')" > "$work_dir/timestamp.txt"
    sleep 10800
done
