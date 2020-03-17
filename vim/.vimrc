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

inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" Enable spell checking only on specific file types
set spelllang=en
autocmd FileType markdown setlocal spell
autocmd FileType text setlocal spell

source $HOME/.vim/plugin/plugins.vim
