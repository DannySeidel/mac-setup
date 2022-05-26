# Mac-Setup

This Repo contains my config files for setting up a new Mac.

## Steps

### 1. Install Apple Command Line Tools:
```shell
xcode-select --install
```

### 2. Clone this git Repo:
```shell
git clone git@github.com:DannySeidel/mac-setup.git ~/.config-files
```

### 3. Run setup script:
```shell
bash ~/.config-files/setup.sh
```
The script runs the following:

`bash ~/.config-files/link-config.sh` to create symlinks in the home directory to the files in the repo.

`link-config.sh` looks like this:
```shell
ln -s ~/.config-files/.zshrc ~/.zshrc
ln -s ~/.config-files/.gitconfig ~/.gitconfig
ln -s ~/.config-files/.gitconfig-private ~/.gitconfig-private
ln -s ~/.config-files/.gitconfig-work ~/.gitconfig-work
```

`bash ~/.config-files/install-software.sh` to install Brew and all software listed in the Brewfile.

`install-software.sh` looks like this:
```shell
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install listed software via brew
brew bundle --file ~/.dotfiles/Brewfile

# Clear brew cache
brew cleanup --prune=all
```
