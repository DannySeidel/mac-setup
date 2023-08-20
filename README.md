# Mac-Setup

![Mac OS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)

This repo contains my config files for setting up a new Mac.

## Setup
To run all listed steps, download and execute the `mac-setup.sh` file with:
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/DannySeidel/mac-setup/main/scripts/mac-setup.sh)"
```
Note that SSH is used to clone the repo. That means you should have set up a SSH key for github, otherwise it will not work.

If you haven't set up a SSH key yet, you can do so following the instructions under this link: [Generating a SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

If you don't want to use a SSH key, consider using HTTPS for cloning the repo.

## Steps

### 1. Install Apple Command Line Tools:
```shell
xcode-select --install
```

### 2. Clone this git Repo:
```shell
git clone git@github.com:DannySeidel/mac-setup.git ~/.config-files
```

### 3. Run setup scripts:

The scripts do the following:

`bash ~/.config-files/scripts/link-config.sh` to create symlinks in the home directory to the files in the repo.

`link-config.sh` looks like this:
```shell
# Terminal config files
ln -s ~/.config-files/.vimrc ~/.vimrc
ln -s ~/.config-files/.p10k.zsh ~/.p10k.zsh
ln -s ~/.config-files/.zshrc ~/.zshrc
ln -s ~/.config-files/.hushlogin ~/.hushlogin

# vscode config files
ln -s ~/.config-files/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.config-files/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Path specific git config
ln -s ~/.config-files/git/.gitconfig ~/.gitconfig
ln -s ~/.config-files/git/.gitconfig-private ~/.gitconfig-private
ln -s ~/.config-files/git/.gitconfig-work ~/.gitconfig-work
ln -s ~/.config-files/git/.gitconfig-gitlab ~/.gitconfig-gitlab
```

`bash ~/.config-files/scripts/configure-dock.sh` to configure the Dock to my preferences:

`configure-dock.sh` looks like this:
```shell
# Set the scale effect for `Command + M`
defaults write com.apple.dock mineffect scale

# Set the Dock to hide automatically
defaults write com.apple.dock autohide -bool true

# Set the icon size to 48
defaults write com.apple.dock tilesize -integer 48

# Set the hover icon size to 64
defaults write com.apple.dock largesize -float 64

# Disable the Dock animation
defaults write com.apple.dock launchanim -bool false

# Delay the Dock appearance by 3 seconds
defaults write com.apple.dock autohide-delay -float 3

# Restart the Dock
killall Dock
```

`bash ~/.config-files/scripts/install-software.sh` to install Brew and all software listed in the Brewfile.

`install-software.sh` looks like this:
```shell
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install listed software via brew
brew bundle --file ~/.config-files/Brewfile

# Install p10k
brew install romkatv/powerlevel10k/powerlevel10k

# Clear brew cache
brew cleanup --prune=all
```

`bash ~/.config-files/scripts/configure-menubar.sh` to configure the Menu bar to my preferences:

`configure-menubar.sh` looks like this:

```shell
# Always show the Menu bar in full screen (may require logout or restart)
defaults write NSGlobalDomain _HIHideMenuBar -bool false

# Enable autohide for the Menu bar in arc
defaults write company.thebrowser.Browser AppleMenuBarVisibleInFullscreen -bool false

# Quit and reopen Arc to apply changes
killall Arc; open -a Arc
```
