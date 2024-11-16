vim.o.tabstop = 4

Map('n', 'Lf', ':silent! Format<CR>')

-- Autocommands
local agId = vim.api.nvim_create_augroup('cs', {})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = agId,
  pattern = {'*.cs'},
  command = ":silent! Format",
})
