#!/bin/sh

echo "Installing nvim config"

if [ -d $HOME/.config/nvim ]; then
	echo "Backing up old config"
	mv $HOME/.config/nvim $HOME/.config/nvim_bak
	echo "mv $HOME/.config/nvim $HOME/.config/nvim_bak"
fi

if [ -f $HOME/.config/nvim ]; then
	echo "File nvim exists, backing up"
	mv $HOME/.config/nvim $HOME/.config/nvim_bak
	echo "mv $HOME/.config/nvim $HOME/.config/nvim_bak"
fi

mkdir -p $HOME/.config/nvim

# This line copies files that do not end in .md or .sh
cp `find -maxdepth 1 -regex '\.\/[^.].*\.[^sm]*'` $HOME/.config/nvim 

# This line copies directories that do not start with .
cp -r `find -maxdepth 1 -regex '\.\/[^.]*'` $HOME/.config/nvim

echo "SUCCESS Installation"
echo "Remember to install nvim plugins with :PlugInstall"
echo "You may need to install the following system packages:"
echo "black (pip install black)"
echo "clang-format"
