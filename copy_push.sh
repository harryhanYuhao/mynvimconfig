#!/bin/sh

cp -r $HOME/.config/nvim/* .
git add * 
git commit 
git push
