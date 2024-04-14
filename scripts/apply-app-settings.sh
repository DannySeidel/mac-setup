#!/bin/bash

# Check if jq is installed, install it if it's missing
if ! command -v jq &> /dev/null
then
    echo "jq could not be found. Attempting to install using Homebrew..."
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null
    then
        echo "Homebrew is not installed. Please install Homebrew and try again."
        exit 1
    fi
    brew install jq
fi


# Directory where the settings files are located
SETTINGS_DIR="$HOME/.config-files/app-settings"

for settings_file in "$SETTINGS_DIR"/*; do
    # Extract the bundle id from the filename
    bundle_id=$(basename "$settings_file")

    # Read each key and value from the JSON file
    while IFS="=" read -r key value; do
        # Use defaults write to apply each setting
        # The sed commands remove quotes added by jq for strings, and brackets for arrays/dictionaries
        defaults write "$bundle_id" "$key" "$(echo "$value" | sed -e 's/^"//' -e 's/"$//' -e 's/^\[//' -e 's/\]$//')"
    done < <(jq -r "to_entries|map(\"\(.key)=\(.value|tojson)\")|.[]" "$settings_file")
    
    # Assuming the app's name is the same as its bundle ID or can be determined from it
    # Modify this line if you need to derive the app name differently
    app_name="$(mdls -name kMDItemCFBundleIdentifier -raw /Applications/*.app | grep -w com.example.bundleid | xargs -I {} mdls -name kMDItemDisplayName -raw /Applications/{}.app
)"
    
    # Check if the app is running, then quit and reopen it
    pgrep -f "$app_name" &> /dev/null
    if [ $? -eq 0 ]; then
        # Tell the app to quit
        osascript -e "tell application \"$app_name\" to quit"
        # Wait for the application to quit
        until ! pgrep -f "$app_name" &> /dev/null; do sleep 1; done
        # Open the application again
        open -a "$app_name"
    fi
done


