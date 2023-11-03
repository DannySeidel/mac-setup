# /bin/bash

echo "Configuring Menu bar..."
defaults write NSGlobalDomain _HIHideMenuBar -bool false

# hide the Menu bar in the TV app and Arc
defaults write com.apple.TV AppleMenuBarVisibleInFullscreen -bool false
killall TV

defaults write company.thebrowser.Browser AppleMenuBarVisibleInFullscreen -bool false
killall Arc; open -a Arc
