vim.opt_local.linebreak = true
vim.opt_local.tabstop = 4

Map('n', 'Lf', ':silent! Format<CR>', {buffer=true}) -- format code

-- Autocommands
local augroup = vim.api.nvim_create_augroup('markdown', {})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = augroup,
  pattern = {'*.md'},
  command = ":silent! Format",
})
