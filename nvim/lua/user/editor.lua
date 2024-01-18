vim.o.scrolloff = 7 -- window edge buffer
vim.o.cursorline = true -- highlight line cursor is on
vim.o.number = true -- line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.showmode = false -- don't show editor mode at bottom

vim.o.swapfile = false -- don't create swapfile
vim.o.updatetime = 100 -- idle ms before write swap or update gitgutter

vim.o.expandtab = true -- turn tabs to spaces
vim.o.tabstop = 2 -- number of columns on tab insert
vim.o.shiftwidth = 0 -- 0 uses tabstop value

vim.o.foldmethod = 'expr' -- fold via user-defined expression
vim.o.foldexpr = 'nvim_treesitter#foldexpr()' -- define fold expression
vim.o.foldlevelstart = 99

vim.api.nvim_create_autocmd( -- improve upon autoread (autoread must be enabled, is by default)
{ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- filetype specific
vim.cmd([[
augroup format
  autocmd!
  autocmd FileType * setlocal formatoptions-=cro  " Disable auto comment insertion
augroup END

augroup text
  autocmd!
  autocmd FileType text,markdown set linebreak  " Don't wrap mid-word (for text files)
  autocmd FileType text,markdown set tabstop=4  " Set tabstop
  autocmd FileType markdown set conceallevel=0  " Don't conceal characters
augroup END

augroup python
  autocmd!
  autocmd FileType python hi pythonSpaceError ctermfg=none ctermbg=none
  autocmd FileType python set tabstop=4
augroup END
]])
