#!/bin/sh

if [ -d $HOME/.config/nvim ]; then
		echo "Backing up old config"
		mv $HOME/.config/nvim $HOME/.config/nvim_bak
		echo "mv $HOME/.config/nvim $HOME/.config/nvim_bak"
fi

mkdir -p $HOME/.config/nvim

# This line copies files that do not end in .md or .sh
cp `find -maxdepth 1 -regex '\.\/[^.].*\.[^sm]*'` $HOME/.config/nvim 

# This line copies directories that do not start with .
cp -r `find -maxdepth 1 -regex '\.\/[^.]*'` $HOME/.config/nvim

