#!/bin/sh

if [ -d $HOME/.config/nvim ]; then
		echo "Backing up old config"
		mv $HOME/.config/nvim $HOME/.config/nvim_bak
		echo "mv $HOME/.config/nvim $HOME/.config/nvim_bak"
fi

cp -r * $HOME/.config/nvim
