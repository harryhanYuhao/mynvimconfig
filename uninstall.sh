#!/bin/sh

echo "Uninstalling (y/n)"
echo "This script will attempt to remove irrevocaly all nvim files, configurations, and plugins systemwise"
read answer

if [[ "$answer" == "y" ]] && [[ `id -u` == 0 ]]; then
    echo "Removing nvim files"
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.cache/nvim
    rm -rf /usr/share/nvim/runtime
fi
