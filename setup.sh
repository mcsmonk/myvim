#!/bin/sh
set -e

if test -e ~/.vimrc
then
	cp ~/.vimrc ./.vimrc.myvimback
	rm ./.vimrc
fi
cp ./.vimrc ~/.vimrc

if test -e .vim/bundle/Vundle.vim
then
else
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


#vim +PluginClean! +PluginInstall +PluginUpdate +qall 2>/dev/null
vim +PluginInstall +PluginUpdate +qall 2>/dev/null



