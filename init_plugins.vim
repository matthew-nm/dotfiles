" ----- PLUGINS via `vim-plug` ----- "

" run `vim-plug` in terminal to install manager

" run the following within vim:
"   PlugInstall
"   PlugUpdate
"   PlugClean
"   PlugUpgrade

call plug#begin()
"Plug 'user/repo', 'branch_or_tag'


" General
Plug 'luochen1990/rainbow'  " rainbow parentheses
Plug 'vim-airline/vim-airline'  " cool status bar
Plug 'vim-scripts/ShowTrailingWhitespace'  " show red when line ends in whitespace
Plug 'Yggdroot/indentLine'  " show line indentations
Plug 'mbbill/undotree'  " show branching history
Plug 'janko/vim-test'  " run tests inside vim
Plug 'tomtom/tcomment_vim'  " comment/uncomment lines easily
Plug 'vim-scripts/YankRing.vim'  " show yank history
Plug 'tpope/vim-characterize'  " more character info on 'ga'
"Plug 'konfekt/fastfold'  " speed up folding

" Themes
Plug 'Dru89/vim-adventurous'
Plug 'vim-airline/vim-airline-themes'

" Files
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }  " file explorer
Plug 'aufgang001/vim-nerdtree_plugin_open', { 'on': 'NERDTreeToggle' }  " open files in external program
Plug 'tpope/vim-vinegar'  " enhance built-in file explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " fzf (fuzzy finder) binary
Plug 'junegunn/fzf.vim'  " fzf plugin
Plug 'jremmen/vim-ripgrep'  " stupid-fast grep'ing
Plug 'stefandtw/quickfix-reflector.vim'  " changes to quickfix are saved to files

" Completion / Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " completion engine
Plug 'ervandew/supertab'  " use <TAB> to select completion option

" Git
Plug 'airblade/vim-gitgutter'  " show the change status of a line
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }  " show git status in nerdtree

" Tmux
Plug 'christoomey/vim-tmux-navigator'  " navigate between vim and tmux


" ----- Languages / Frameworks ----- "

" Flutter / Dart
Plug 'dart-lang/dart-vim-plugin'  " dart language syntax
Plug 'reisub0/hot-reload.vim'  " hot-reload on save

" Haskell
Plug 'neovimhaskell/haskell-vim'  " haskell language syntax

" Markdown
Plug 'plasticboy/vim-markdown'  " markdown language syntax

" Python
Plug 'vim-python/python-syntax'  " python language syntax
Plug 'tmhedberg/SimpylFold'  " enable folding python code

" SQL
Plug 'magicalbanana/sql-syntax-vim'  " sql language syntax


call plug#end()


" -------------------------- "
" ----- CONFIGURATIONS ----- "
" -------------------------- "


" ----- airline ----- "

let g:airline_powerline_fonts = 1


" ----- indentLine ----- "

let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['json', 'markdown']


" ----- Markdown sytnax ----- "

let g:vim_markdown_conceal = 0


" ----- NERDTree ----- "

" Show hidden files by default
let NERDTreeShowHidden = 1

" Ignore certain filetypes
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.swo$']

" Some weird bug fix...
"let g:NERDTreeGlyphReadOnly = "RO"

" Configure NerdtreePluginOpen
let g:nerdtree_plugin_open_cmd = 'xdg-open'


" ----- Python-Syntax ----- "

let g:python_highlight_all = 1


" ----- rainbow ----- "

let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\}


" ----- ripgrep ----- "

let g:rg_command = 'rg --vimgrep -S'  " use smartcase search


" ----- SimpylFold ----- "

let g:SimpylFold_fold_import = 0
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_docstring_preview = 1


" ----- supertab ----- "

let g:SuperTabDefaultCompletionType = "<c-n>"


" ----- vim-tmux-navigator ----- "

" Disable tmux navigator when tmux is zoomed on the vim pane
let g:tmux_navigator_disable_when_zoomed = 1
