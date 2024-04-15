#!/bin/bash

# Check if an application name was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <AppName>"
  exit 1
fi

app_name="$1"

# Check if the app is running
pgrep -f "$app_name" &> /dev/null
if [ $? -eq 0 ]; then
    # Tell the app to quit
    osascript -e "tell application \"$app_name\" to quit"
    # Wait for the application to quit
    until ! pgrep -f "$app_name" &> /dev/null; do sleep 1; done
    # Open the application again
    open -a "$app_name"
fi

