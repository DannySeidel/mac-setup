# /bin/bash

echo "Configuring Menu bar..."
defaults write NSGlobalDomain _HIHideMenuBar -bool false
defaults write company.thebrowser.Browser AppleMenuBarVisibleInFullscreen -bool false

killall Arc; open -a Arc
