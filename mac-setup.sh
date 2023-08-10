# /bin/bash

# Install apple command line tools
echo "Installing command line tools..."
xcode-select --install

# Clone git repo containing config files
echo "Cloning config files..."
git clone git@github.com:DannySeidel/mac-setup.git ~/.config-files

# Run setup
bash ~/.config-files/link-config.sh
bash ~/.config-files/install-software.sh
