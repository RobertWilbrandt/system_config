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

" Linting and fixing
nmap <Leader>C :ALELint<CR>
vmap <Leader>C :ALELint<CR>
nmap <Leader>F :ALEFix<CR>
vmap <Leader>F :ALEFix<CR>

" Navigating warnings
nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

set spelllang=en

source $HOME/.vim/plugin/plugins.vim
