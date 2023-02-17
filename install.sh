#!/bin/bash

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone http://github.com/harryhanYuhao/mynvimconfig.git 

cd mynvimconfig

mv * ~/.config/nvim


