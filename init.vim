" ----- GENERAL ----- "

" Theme
colorscheme adventurous
let g:airline_theme='distinguished'

" Editor
set autoread  " automatically read file if changes outside vim and not inside vim (BROKEN in neovim)
set cursorline  " show different coloring on line where cursor currently is
set fillchars=vert:│,fold:—  " charcters used to separate buffers, etc.
set hidden  " allow unsaved changes to buffers
"set lazyredraw  " screen is not redrawn during macro execution
set mouse=a  " turn on mouse for all modes
set pastetoggle=<F3>  " toggle PASTE mode
set relativenumber  " show line numbers (relative to current line)
set scrolloff=7  " scroll offset from edge of screen
set shortmess+=c  " c - don't give ins-completion-menu messages (req for coc.nvim)
set signcolumn=yes  " set signcolumn to always show
set noshowmode  " don't show mode (Normal, Visual, etc) at bottom of screen
set whichwrap+=<,>  " allow space and backspace to move around wrapped lines

" Files
set nobackup  " don't create backup file before overwrite (req for coc.nvim)
set nowritebackup  " don't create backup file during overwrite (req for coc.nvim)
set noswapfile  " don't create swapfile
set updatetime=300  " how many milliseconds to sit idle before writing swap (probably not necessary if swapfile is off)

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

" Close all buffers
nmap <silent> <leader>C :%bd<cr>
" nmap <silent> <leader>C :%bd \| NERDTreeToggle<cr>

" Splits
nmap <leader>v :vsplit<cr>
nmap <leader>V :split<cr>

" New tab
nmap <leader>t :tabnew<cr>
nmap <leader>T :-1tabnew<cr>
" nmap <leader>T0 :0tabnew<cr>
" nmap <leader>T$ :$tabnew<cr>

" Replace all instances of word under cusor
nmap <leader>r :ReplaceWordUnderCursor<cr>

" Rename symbol
nmap <leader>R <Plug>(coc-rename)

" Initiate ripgrep
nmap <leader>g :Rg 

" Fold/unfold all
nmap <leader>z zA

" Turn off highlighting
nmap <leader><space> :noh<cr>

" Toggle NERDTree
nmap <silent> <leader>e :NERDTreeToggle<cr>

" Toggle Coc-Explorer
nmap <silent> <leader>E :CocCommand explorer<cr>

" Toggle undotree
nmap <silent> <leader>u :UndotreeToggle<cr>

" Toggle yankring
nmap <leader>p :YRShow<cr>

" fzf (fuzzy file finder)
nmap <leader>f :Files<cr>

" vim-test
" THESE SHOULD BE CHANGED SO NEW TAB ISN'T SLOWED DOWN
" nmap <leader>tn :TestNearest<cr>
" nmap <leader>tf :TestFile<cr>
" nmap <leader>ts :TestSuite<cr>
" nmap <leader>tl :TestLast<cr>
" nmap <leader>tv :TestVisit<cr>

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


" ----- COC.NVIM ----- "

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" ----- COMMANDS + FUNCTIONS ----- "

" Reload init.vim
command! Reload :source $MYVIMRC

" Sudo write
command! Sudow w !sudo tee % >/dev/null

" Format current buffer
command! -nargs=0 Format :call CocAction('format')

" Clean trailing whitespace
command! CleanWhitespace
  \ let b:bufview=winsaveview() |
  \ :%s/\s\+$//g                |
  \ :execute "normal \<C-O>"    |
  \ call winrestview(b:bufview) |
  \ :noh

" Toggle show trailing whitespace
command! ShowWhitespace :call ShowTrailingWhitespace#Toggle(1)

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

" Show hightlight group of word under cursor
command! ShowHighlightGroup :call <SID>SynStack()
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Add custom 'autoread' solution
if ! exists("g:CheckUpdateStarted")
    let g:CheckUpdateStarted=1
    call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
    silent! checktime
    call timer_start(1000,'CheckUpdate')
endfunction

" Filter Quickfix list
function! s:FilterQuickfixList(bang, pattern)
  let cmp = a:bang ? '!~#' : '=~#'
  call setqflist(filter(getqflist(), "bufname(v:val['bufnr']) " . cmp . " a:pattern"))
endfunction
command! -bang -nargs=1 -complete=file Qfilter call s:FilterQuickfixList(<bang>0, <q-args>)
command! -bang -nargs=1 -complete=file Qf call s:FilterQuickfixList(<bang>0, <q-args>)

" Restore Quickfix list
command! Qoriginal :colder
command! Qo :colder

" <CR>: close popup and save indent
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction


" ----- FILETYPE SPECIFIC ----- "

filetype plugin indent on  " required here for neovim

augroup format
  autocmd!
  " Disable auto comment insertion
  autocmd FileType * setlocal formatoptions-=cro
  " Highlight the symbol and its references when holding the cursor.
  " autocmd CursorHold * silent call CocActionAsync('highlight')
  " Automatically format text when leaving Insert mode
  " autocmd InsertLeave * :call CocAction('format')
augroup END

augroup text
  autocmd!
  " Don't wrap mid-word (for text files)
  autocmd FileType text,markdown set linebreak
  " Set tabstop
  autocmd FileType text,markdown set tabstop=4
  " Don't conceal characters
  autocmd FileType markdown set conceallevel=0
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
