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

"ctags
set tags=tags;/

" Japanese
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" pathogen
call pathogen#infect()
call pathogen#helptags()
