if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync ~ source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter' " show git diff in file
Plug 'dense-analysis/ale' " Linters & fixers
Plug 'fmauch/YCM-Generator', { 'branch': 'stable' } " Generate ycm_extra_conf files
Plug 'jiangmiao/auto-pairs' " Add paranthesis, brackets, ... in pairs
Plug 'majutsushi/tagbar' " give outline of cpp structures defined in the current file
Plug 'ntpeters/vim-better-whitespace' " highlight whitespaces at line ends
Plug 'richq/vim-cmake-completion'
Plug 'rhysd/vim-clang-format' " automate code formatting
Plug 'scrooloose/nerdtree' " file system expolorer
Plug 'sirver/ultisnips' " snippets
Plug 'valloric/YouCompleteMe', { 'do': './install.py --clang-completer' } " Code completion
Plug 'vim-airline/vim-airline' " better status line
Plug 'vim-scripts/DoxygenToolkit.vim' " doxygen integration

if executable('latex')
  Plug 'lervag/vimtex'
endif

call plug#end()

" Ale
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fixers = {
\  'python': ['black', 'isort'],
\  'xml': ['xmllint']
\}
let g:ale_python_flake8_options = "--max-line-length=88"
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0

" Tagbar
nmap <C-t> :TagbarToggle<CR>
let g:tagbar_autoclose = 1

" vim-flake8
let g:flake8_show_in_file=1

" clang-format
let g:clang_format#detect_style_file = 1

" NERDtree
let g:NERDTreeQuitOnOpen=1
nmap <Leader>t :NERDTreeToggle<CR>

" UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/vim_snippets']
let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsExpandTrigger="<c-k>" " Cannot use just tab because of YCM
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" YCM
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_comletion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 0
" vimtex integration
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
if executable('latex')
    let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
endif

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
nmap <C-w>1 <Plug>AirlineSelectTab1
nmap <C-w>2 <Plug>AirlineSelectTab2
nmap <C-w>3 <Plug>AirlineSelectTab3
nmap <C-w>4 <Plug>AirlineSelectTab4
nmap <C-w>5 <Plug>AirlineSelectTab5
nmap <C-w>6 <Plug>AirlineSelectTab6
nmap <C-w>7 <Plug>AirlineSelectTab7
nmap <C-w>8 <Plug>AirlineSelectTab8
nmap <C-w>9 <Plug>AirlineSelectTab9

" Doxygen Toolkit
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="\\param "
let g:DoxygenToolkit_returnTag_pre="\\returns "
let g:DoxygenToolkit_fileTag_pre="\\file "
let g:DoxygenToolkit_authorTag="\\author "
let g:DoxygenToolkit_dateTag="\\date "
let g:DoxygenToolkit_versionTag="\\version "
let g:DoxygenToolkit_classTag="\\class "
let g:DoxygenToolkit_blockTag="\\name"
let g:DoxygenToolkit_startCommentTag="/** "
let g:DoxygenToolkit_startCommentBlock="/* "

" vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
