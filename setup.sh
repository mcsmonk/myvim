#!/bin/sh
set -e

#:let $PATH .= '~/myvim'

echo "set ~/.vimrc file\n"
if test -e ~/.vimrc
then
	cp ~/.vimrc ./.vimrc.myvimback
	rm ~/.vimrc
fi
cp ./.vimrc ~/.vimrc

echo "set ~/.vim/mysnippets\n"
if test -e ~/.vim/mysnippets
then
        rm -rf ~/.vim/mysnippets/*
else
        mkdir ~/.vim/mysnippets
fi
cp ./mysnippets/* ~/.vim/mysnippets/

echo "set vundle.vim..."
# https://stackoverflow.com/questions/15316601/in-what-cases-could-git-pull-be-harmful
git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'
repo=~/.vim/bundle/Vundle.vim
if test -e ${repo}
then
	(cd "${repo}" && git checkout master && git up)
else
	git clone https://github.com/VundleVim/Vundle.vim.git ${repo}
fi
echo "set vundle.vim...end\n"

echo "set vundle.vim plugin... press any key"
#vim +PluginClean! +PluginInstall +PluginUpdate +qall 2>/dev/null
#$(vim +PluginInstall +PluginUpdate +qall 2>/dev/null)
vim +PluginInstall +PluginUpdate +qall 2>/dev/null
echo "set vundle.vim plugin...end\n"
