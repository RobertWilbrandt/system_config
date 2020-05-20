" Linting and fixing
nmap <Leader>C :ALELint<CR>
vmap <Leader>C :ALELint<CR>
nmap <Leader>F :ALEFix<CR>
vmap <Leader>F :ALEFix<CR>

" Navigating warnings
nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
