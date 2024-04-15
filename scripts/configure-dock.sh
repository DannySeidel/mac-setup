# /bin/bash

echo "Setting Dock config..."
defaults write com.apple.dock mineffect scale
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -integer 48
defaults write com.apple.dock largesize -float 64
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock autohide-delay -float 3

killall Dock

