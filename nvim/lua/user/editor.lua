vim.o.scrolloff = 7 -- window edge buffer
vim.o.cursorline = true -- highlight line cursor is on
vim.o.showmode = false -- don't show editor mode at bottom
vim.o.updatetime = 100 -- quicken updates for LSP diagnostic windows

vim.o.swapfile = false -- don't create swapfile

vim.o.number = true -- line numbers
vim.o.relativenumber = true -- relative line numbers

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
