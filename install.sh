#!/bin/sh

RED="\033[0;31m"
NC="\033[0m"

set -e  # stop the execution if any of the command failed

if [ `pwd` = "/home/`whoami`/.config/nvim" ] ; then
	echo "You are in nvim runtime directory; Nothing to be done"
exit 0
fi


echo "Installing nvim config"

if [ -d $HOME/.config/nvim ]; then
	if [ -d $HOME/.config/nvim_bak ]; then
		printf "${HOME}/.config/nvim_bak exists, do you want to remove it? (y/n)"
		read response
		if [ "$response" = "y" ]; then
			rm -rf $HOME/.config/nvim_bak
			printf "$HOME/.config/nvim_bak deleted\n"
		else
			printf "${RED}FAILED${NC} to back up old configuration!\n"
			exit 1
		fi
	fi
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

printf "${RED}SUCCESS${NC} installation!\n"
echo "Remember to install nvim plugins with :PlugInstall"
echo "See guide/readme.md for more information."
