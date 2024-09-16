#!/bin/sh
set -e

cd ~/.vim_runtime
cat ~/.vim_runtime/vimrcs/vimrc_Linux.vim > ~/.vimrc
echo "Installed the Vim configuration successfully! Enjoy :-)"