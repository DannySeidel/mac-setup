# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install listed software via brew
brew bundle --file ~/.config-files/Brewfile

# Install p10k
brew install romkatv/powerlevel10k/powerlevel10k

# Clear brew cache
brew cleanup --prune=all

