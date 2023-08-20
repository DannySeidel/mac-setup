# /bin/bash

# Install apple command line tools
echo "Installing command line tools..."
xcode-select --install

# Clone git repo containing config files
echo "Cloning config files..."
git clone git@github.com:DannySeidel/mac-setup.git ~/.config-files

# Run setup
bash ~/.config-files/scripts/link-config.sh
bash ~/.config-files/scripts/configure-dock.sh
bash ~/.config-files/scripts/install-software.sh
bash ~/.config-files/scripts/configure-menubar.sh
