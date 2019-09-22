#!/bin/sh
set -e

#:let $PATH .= '~/myvim'

if test -e ~/.vimrc
then
	cp ~/.vimrc ./.vimrc.myvimback
	rm ~/.vimrc
fi
cp ./.vimrc ~/.vimrc

# https://stackoverflow.com/questions/15316601/in-what-cases-could-git-pull-be-harmful
git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'
repo=~/.vim/bundle/Vundle.vim
if test -e ${repo}
then
	(cd "${repo}" && git checkout master && git up)
else
	git clone https://github.com/VundleVim/Vundle.vim.git ${repo}
fi
echo "Enter !"

#vim +PluginClean! +PluginInstall +PluginUpdate +qall 2>/dev/null
$(vim +PluginInstall +PluginUpdate +qall 2>/dev/null)

