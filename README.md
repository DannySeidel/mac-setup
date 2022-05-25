# Config-Files

This Repo contains my config files for setting up an new Mac.

## Steps

### 1. Install Apple Command Line Tools:
```shell
xcode-select --install
```

### 2. Clone this git Repo:
```shell
git clone git@github.com:DannySeidel/.config-files.git
```

### 3. Create symlinks in the home directory to the files in the repo:
```shell
ln -s ~/.config-files/.zshrc ~/.zshrc
ln -s ~/.config-files/.gitconfig ~/.gitconfig
```

### 4. Install Brew and all software listed in the Brewfile:
```shell
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install listed software via brew
brew bundle --file ~/.dotfiles/Brewfile
```
