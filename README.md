# Mac-Setup

![Mac OS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)

This repo contains my config files for setting up a new Mac.

## Setup
To run all listed steps, download and execute the `mac-setup.sh` file with:
```shell
bash mac-setup.sh
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

### 3. Run setup script:
```shell
bash ~/.config-files/setup.sh
```
The script runs the following:

`bash ~/.config-files/link-config.sh` to create symlinks in the home directory to the files in the repo.

`link-config.sh` looks like this:
```shell
mkdir -p ~/.vim/colors
ln -s ~/.config-files/onehalf.vim ~/.vim/colors/onehalf.vim

ln -s ~/.config-files/.vimrc ~/.vimrc
ln -s ~/.config-files/.p10k.zsh ~/.p10k.zsh
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
brew bundle --file ~/.config-files/Brewfile

# Install p10k
brew install romkatv/powerlevel10k/powerlevel10k

# Clear brew cache
brew cleanup --prune=all
```
