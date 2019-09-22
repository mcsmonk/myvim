

set encoding=utf-8 fileencodings=ucs-bom,utf-8,euc-kr,cp949

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

"===========================================
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

source ~/myvim/kernel.vimplugin

call vundle#end()
"===========================================

filetype plugin indent on

" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

try

source ~/myvim/myvim.vim
source ~/myvim/kernel.vim

catch
echo FAIL : load vim set file
endtry
