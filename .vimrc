" common settings
syntax on
set autoindent
set number
set expandtab
set tabstop=4
set laststatus=2
set backspace=2
set hls
hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
"man pages with :Man
runtime ftplugin/man.vim
"------------------------------------------------------------------------------------------

"ctags
set tags=tags;/
"------------------------------------------------------------------------------------------

" Char Code(old)
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

"Char Code
if has('iconv')
   let s:enc_euc = 'euc-jp'
   let s:enc_jis = 'iso-2022-jp'
   " iconvがeucJP-msに対応しているかをチェック
   if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
       let s:enc_euc = 'eucjp-ms'
       let s:enc_jis = 'iso-2022-jp-3'
   " iconvがJISX0213に対応しているかをチェック
   elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
       let s:enc_euc = 'euc-jisx0213'
       let s:enc_jis = 'iso-2022-jp-3'
   endif
   " fileencodingsを構築
   if &encoding ==# 'utf-8'
       let s:fileencodings_default = &fileencodings
       let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
       let &fileencodings = &fileencodings .','. s:fileencodings_default
       unlet s:fileencodings_default
   else
       let &fileencodings = &fileencodings .','. s:enc_jis
       set fileencodings+=utf-8,ucs-2le,ucs-2
       if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
           set fileencodings+=cp932
           set fileencodings-=euc-jp
           set fileencodings-=euc-jisx0213
           set fileencodings-=eucjp-ms
           let &encoding = s:enc_euc
           let &fileencoding = s:enc_euc
       else
           let &fileencodings = &fileencodings .','. s:enc_euc
       endif
   endif
   " 定数を処分
   unlet s:enc_euc
   unlet s:enc_jis
endif
"------------------------------------------------------------------------------------------

" pathogen for manual plugin install
call pathogen#infect()
call pathogen#helptags()
"------------------------------------------------------------------------------------------

"neobundle for installation from remote(github)
if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
           
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
             
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"My Bundles here
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'nishigori/vim-php-dictionary'

call neobundle#end()
                         
" Required:
filetype plugin indent on
                           
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"------------------------------------------------------------------------------------------

"omnifunc
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType ejs set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

"au BufRead,BufNewFile *.scala set filetype=scala
"au BufNewFile,BufRead *.go set filetype=go

"omnifunc error support
"setlocal omnifunc=syntaxcomplete#Complete
"":map <silent> <F3> :setlocal omnifunc=syntaxcomplete#Complete<CR>

"dictionary
"autocmd FileType php set dictionary=~/.vim/dict/PHP.dict
"autocmd FileType js set dictionary=~/.vim/dict/javascript.dict
"autocmd FileType scala set dictionary=~/.vim/dict/scala.dict
"autocmd FileType java set dictionary=~/.vim/dict/java.dict
"autocmd FileType c set dictionary=~/.vim/dict/c.dict
"autocmd FileType cpp set dictionary=~/.vim/dict/cpp.dict
"------------------------------------------------------------------------------------------

"ctrl-p setting
let g:ctrlp_match_window = 'max:10,results:100' 

