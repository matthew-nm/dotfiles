" ----- GENERAL ----- "

" Theme
colorscheme adventurous
" let g:airline_theme='distinguished'

" Editor
set cursorline  " show different coloring on line where cursor currently is
set fillchars=vert:│,fold:—  " charcters used to separate buffers, etc.
set hidden  " allow unsaved changes to buffers
" set mouse=a  " turn on mouse for all modes
set pastetoggle=<F3>  " toggle PASTE mode
set relativenumber  " show line numbers (relative to current line)
set scrolloff=7  " scroll offset from edge of screen
set signcolumn=yes  " set signcolumn to always show
set noshowmode  " don't show mode (Normal, Visual, etc) at bottom of screen
set whichwrap+=<,>  " allow space and backspace to move around wrapped lines

" Files
set noswapfile  " don't create swapfile

" <TAB>
set expandtab  " expand TABs into spaces
set tabstop=2  " how may columns to tab
set shiftwidth=0  " setting to 0 uses 'tabstop' value


" ----- EDITING / MOVEMENT ----- "

" Set up/down to work with wrapped lines
nnoremap k gk
nnoremap j gj
" ...and because I'm sloppy...
nnoremap K gk
nnoremap J gj

" Set jj to exit insert mode
inoremap jj <esc>

" Map <space> to insensitive search
nmap <space> /\c

" Map <space><space> to word search
nmap <space><space> /\<\><Left><Left>

" Bind system clipboard
vnoremap <C-c> "+y

" Fold level
nmap z1 :set foldlevel=1<cr>
nmap z2 :set foldlevel=2<cr>


" ----- COLORS ----- "

hi Normal       ctermfg=195 ctermbg=233
hi Visual ctermbg=52
hi Comment      ctermfg=247
hi String       ctermfg=80

hi Folded       ctermfg=49 ctermbg=NONE
" hi IncSearch    ctermbg=214 cterm=underline
hi Search       ctermbg=214 cterm=none
hi Todo ctermfg=196 ctermbg=none cterm=none
hi Type cterm=none ctermfg=122
hi Typedef ctermfg=211
hi StorageClass ctermfg=147
hi Constant ctermfg=198
hi Identifier ctermfg=45
hi Special ctermfg=224
hi PreProc ctermfg=045
hi Statement ctermfg=190
hi Directory ctermfg=36
hi Conditional ctermfg=220
hi Operator ctermfg=45
hi Function ctermfg=43

hi TabLineSel ctermfg=36 ctermbg=none
hi TabLine ctermfg=245 ctermbg=none
hi TabLineFill ctermbg=none
hi Title ctermfg=045
hi MatchParen   ctermfg=196 ctermbg=NONE cterm=none
hi LineNr       ctermbg=none
hi CursorLineNr ctermfg=214 ctermbg=235
hi CursorLine   ctermbg=235 cterm=NONE
hi SignColumn   ctermbg=none ctermfg=none
hi VertSplit    ctermbg=none ctermfg=236
hi Pmenu        ctermfg=153 ctermbg=53

hi DiffAdd    ctermbg=none ctermfg=002
hi DiffChange ctermbg=none ctermfg=220
hi DiffDelete ctermbg=none ctermfg=001

" Statusline
hi clear StatusLineNC
hi StatusLine ctermbg=234
