# /bin/bash

echo "Linking config files..."
ln -s ~/.config-files/.vimrc ~/.vimrc
ln -s ~/.config-files/.p10k.zsh ~/.p10k.zsh
ln -s ~/.config-files/.zshrc ~/.zshrc
ln -s ~/.config-files/.hushlogin ~/.hushlogin

ln -s ~/.config-files/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.config-files/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

ln -s ~/.config-files/git/.gitconfig ~/.gitconfig
ln -s ~/.config-files/git/.gitconfig-private ~/.gitconfig-private
ln -s ~/.config-files/git/.gitconfig-work ~/.gitconfig-work
ln -s ~/.config-files/git/.gitconfig-gitlab ~/.gitconfig-gitlab

ln -s ~/.config-files/karabiner ~/.config/karabiner

