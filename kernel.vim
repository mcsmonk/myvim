"======================================
" airline settings
"======================================
set laststatus=2
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts = 1 

"======================================
" ctags and csope settings
" =====================================
"/mnt/c/Users/jin/Desktop/iamroot/linux/
"let pathkernel=/mnt/c/Users/jin/Desktop/iamroot/linux
"set tags+=${pathkernel}/tags
set tags+=/mnt/c/Users/jin/Desktop/iamroot/linux/tags
set ignorecase

set csprg=/usr/bin/cscope " location of cscope
set csto=0 " cscope DB search first
set cst " cscope DB tag DB search
set nocsverb " no verbose

"cs add ${pathkernel}/cscope.out ${pathkernel}/
cs add /mnt/c/Users/jin/Desktop/iamroot/linux/cscope.out /mnt/c/Users/jin/Desktop/iamroot/linux/
set csverb

"======================================
" easy tags setting
"======================================
set tag=./tags;/
let g:easytags_async=1 " for lessen loading time
let g:easytags_auto_highlight=0 " if slow, disable this
let g:easytags_include_members=1
let g:easytags_dynamic_files=1

"======================================
" quickr-cscope settings
"======================================
function! LoadCscope()
        let db = findfile("cscope.out", ".;")
        if (!empty(db))
                let path = strpart(db, 0, match(db, "/cscope.out$"))
                set nocscopeverbose " suppress 'duplicate connection' error
                exe "cs add " . db . " " . path
                set cscopeverbose
        "else add the database pointed to by environment variable 
        elseif $CSCOPE_DB != "" 
                cs add $CSCOPE_DB
        endif
endfunction
au BufEnter /* call LoadCscope()

" let g:quickr_cscope_use_qf_g = 1 " use easy tag's C-t
