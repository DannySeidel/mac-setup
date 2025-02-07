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
git_root=$(git rev-parse --show-toplevel)
SETTINGS_DIR="$git_root/app-settings"

for settings_file in "$SETTINGS_DIR"/*; do
    # Extract the bundle id from the filename
    bundle_id=$(basename "$settings_file")
    app_name="$(mdfind "kMDItemCFBundleIdentifier == '$bundle_id'" | xargs -n 1 basename | grep '\.app$' | head -n 1)"
   
    if [ -z "$app_name" ]
    then
      app_name="$bundle_id"
    fi

    echo "Applying settings for $(echo $app_name | sed 's/\.app$//')..."

    # Read each key and value from the JSON file
    while IFS="=" read -r key value; do
        # Use defaults write to apply each setting
        # The sed commands remove quotes added by jq for strings, and brackets for arrays/dictionaries
        defaults write "$bundle_id" "$key" "$(echo "$value" | sed -e 's/^"//' -e 's/"$//' -e 's/^\[//' -e 's/\]$//')"
    done < <(jq -r "to_entries|map(\"\(.key)=\(.value|tojson)\")|.[]" "$settings_file")
    

    if [ "$app_name" != "$bundle_id" ]
    then
      echo "Restarting $app_name..."
      $git_root/scripts/restart-app.sh $app_name
    fi

done

