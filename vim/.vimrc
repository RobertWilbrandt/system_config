filetype plugin indent on

" Replace tabs with two spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Enable relative line numbers
set relativenumber
set number

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Set leader key to space
:let mapleader = " "

syntax enable

imap <C-S-v> <Esc>"+p
vmap <C-S-c> "+y

set spell spelllang=en_us

inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" Treat launch files as xml files
autocmd BufNewFile,BufRead *.launch setfiletype xml

source $HOME/.vim/plugin/plugins.vim
