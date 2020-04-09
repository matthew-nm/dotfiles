" ----- GENERAL ----- "

" Theme
colorscheme adventurous
let g:airline_theme='distinguished'

" Editor
set autoread  " automatically read file if changes outside vim and not inside vim
set cursorline  " show different coloring on line where cursor currently is
set fillchars=vert:│,fold:—  " charcters used to separate buffers, etc.
set hidden  " allow unsaved changes to buffers
"set lazyredraw  " screen is not redrawn during macro execution
set mouse=a  " turn on mouse for all modes
set pastetoggle=<F3>  " toggle PASTE mode
set relativenumber  " show line numbers (relative to current line)
set scrolloff=7  " scroll offset from edge of screen
set noshowmode  " don't show mode (Normal, Visual, etc) at bottom of screen
set whichwrap+=<,>  " allow space and backspace to move around wrapped lines

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

" Move to next lint error
map <silent> <C-j> :ALENextWrap<cr>
map <silent> <C-k> :ALEPreviousWrap<cr>

" Bind system clipboard
"vnoremap <C-c> "+y

" Yank to tmux clipboard (vim-tbone)
"nnoremap ty :Tyank<cr>
"vnoremap ty :Tyank<cr>

" Fold level
nmap z1 :set foldlevel=1<cr>
nmap z2 :set foldlevel=2<cr>


" ----- LEADER ----- "

" Remap <leader> key
let mapleader = ","
let g:mapleader = ","

" Save
nmap <leader>w :w<cr>

" Quit
nmap <leader>q :qa<cr>
nmap <leader>Q :qa!<cr>

" Hide buffer
nmap <leader>h :hide<cr>

" Delete buffer (total wipeout)
nmap <leader>d :bw<cr>

" Close all hidden buffers
nmap <leader>c :call CloseHiddenBuffers()<cr>

" Close all buffers (then, reopen NERDTree)
nmap <silent> <leader>C :%bd \| NERDTreeToggle<cr>

" Splits
nmap <leader>v :vsplit<cr>
nmap <leader>V :split<cr>

" New tab
nmap <leader>tt :tabnew<cr>
nmap <leader>T0 :0tabnew<cr>
nmap <leader>T$ :$tabnew<cr>

" Replace all instances of word under cusor
nmap <leader>r :ReplaceWordUnderCursor<cr>

" Initiate ripgrep
nmap <leader>g :Rg 

" Fold/unfold all
nmap <leader>z zA

" Turn off highlighting
nmap <leader><space> :noh<cr>

" Toggle NERDTree
nmap <silent> <leader>e :NERDTreeToggle<cr>

" Toggle undotree
nmap <silent> <leader>u :UndotreeToggle<cr>

" Toggle yankring
nmap <leader>p :YRShow<cr>

" fzf (fuzzy file finder)
nmap <leader>f :Files<cr>

" vim-test
nmap <leader>tn :TestNearest<cr>
nmap <leader>tf :TestFile<cr>
nmap <leader>ts :TestSuite<cr>
nmap <leader>tl :TestLast<cr>
nmap <leader>tv :TestVisit<cr>

" Toggle tagbar
"nmap <silent> <leader>E :TagbarToggle<cr>

" Toggle tabman
"let g:tabman_toggle = '<leader>TT'

" YouCompleteMe GoTo
"nnoremap <leader>jd :YcmCompleter GoTo<cr>
"nnoremap <leader>jr :YcmCompleter GoToReferences<cr>
"nnoremap <silent> <leader>gt :YcmCompleter GetType<cr>
"nnoremap <leader>gd :YcmCompleter GetDoc<cr>

" Tabularize
"nmap <Leader>a= :Tabularize /=<cr>
"vmap <Leader>a= :Tabularize /=<cr>
"nmap <Leader>a: :Tabularize /:<cr>
"vmap <Leader>a: :Tabularize /:<cr>
"nmap <Leader>a<bar> :Tabularize /<bar><cr>
"vmap <Leader>a<bar> :Tabularize /<bar><cr>

" Yankring, show
"nmap <leader>p :YRShow<cr>

" Far.vim replace
"nmap <leader>r :Farp<cr>
"nmap <leader>R :Fardo<cr>


" ----- COMMANDS + FUNCTIONS ----- "

" Reload init.vim
command! Src :so $MYVIMRC

" Sudo write
command! Sudow w !sudo tee % >/dev/null

" Clean trailing whitespace
command! CleanWhitespace
  \ let b:bufview=winsaveview() |
  \ :%s/\s\+$//g                |
  \ :execute "normal \<C-O>"    |
  \ call winrestview(b:bufview) |
  \ :noh

" Replace all instances of word under cursor
command! ReplaceWordUnderCursor
  \ let b:bufview=winsaveview()                         |
  \ let b:foo=expand('<cword>')                         |
  \ :execute "let b:bar=input('Replace" b:foo "with ')" |
  \ :execute ":%s/\\<".b:foo."\\>/".b:bar."/g"          |
  \ :execute "?\\<".b:bar."\\>"                         |
  \ call winrestview(b:bufview)

" Close hidden buffers
function CloseHiddenBuffers()
  let open_buffers = []
  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor
  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

" <CR>: close popup and save indent
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction


" ----- FILETYPE SPECIFIC ----- "

filetype plugin indent on  " required here for neovim

augroup all
  autocmd!
  " Disable auto comment insertion
  autocmd FileType * setlocal formatoptions-=cro
augroup END

augroup text
  autocmd!
  " Don't wrap mid-word (for text files)
  autocmd FileType text,markdown set linebreak
  " Don't conceal characters
  "autocmd FileType markdown set conceallevel=0
augroup END

augroup python
  autocmd!
  autocmd FileType python hi pythonSpaceError ctermfg=none ctermbg=none
  autocmd FileType python set tabstop=4
augroup END

augroup json
  autocmd!
  " Don't highlight single extra space at end of json lines
  autocmd FileType json call ShowTrailingWhitespace#SetLocalExtraPattern(',\s$')
augroup END


" ----- COLORS ----- "

hi Normal       ctermfg=195 ctermbg=233
hi Visual ctermbg=52
hi Comment      ctermfg=247
hi String       ctermfg=80

hi Folded       ctermfg=49 ctermbg=NONE
" hi IncSearch    ctermbg=214 cterm=underline
hi Search       ctermbg=214 cterm=none
hi Todo ctermfg=196 ctermbg=none cterm=none
hi Type cterm=none
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
"
hi MatchParen   ctermfg=196 ctermbg=NONE cterm=none
""hi MatchParen   ctermfg=226 ctermbg=NONE
"
hi LineNr       ctermbg=none
hi CursorLineNr ctermfg=214 ctermbg=235
hi CursorLine   ctermbg=235 cterm=NONE
" hi SignColumn   ctermbg=none ctermfg=none
hi VertSplit    ctermbg=none ctermfg=236

"hi CursorColumn ctermbg=235
"hi ColorColumn  ctermbg=235
"
""hi TabLine      ctermfg= ctermbg=
"hi TabLineSel   ctermfg=015 ctermbg=000
"hi TabLineFill  ctermfg=235

" ale (linter engine)
hi ALEErrorSign   ctermbg=none ctermfg=124
hi ALEWarningSign ctermbg=none ctermfg=178

" Git Gutter (git changes)
hi GitGutterAdd    ctermbg=none ctermfg=002
hi GitGutterChange ctermbg=none ctermfg=220
hi GitGutterDelete ctermbg=none ctermfg=001