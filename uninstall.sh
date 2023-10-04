#!/bin/sh

echo "Uninstalling (y/n)"
echo "This script will attempt to remove irrevocaly all nvim files, configurations and plugins in user space"
read answer

if [ "$answer" = "y" ]; then
    echo "Removing nvim files"
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.cache/nvim
    cd ~
fi

echo "to uninstall systemwise, use your package manager"
