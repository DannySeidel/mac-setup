# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install listed software via brew
brew bundle --file ~/.config-files/Brewfile

# Clear brew cache
brew cleanup --prune=all

