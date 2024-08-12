vim.o.tabstop = 4
-- vim.api.nvim_set_hl(0, 'pythonSpaceError', {fg='none', bg='none'})

Map('n', 'Lf', ':Format<CR>') -- format code

-- Autocommands
local augroup = vim.api.nvim_create_augroup('python', {})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = augroup,
  pattern = {'*.py'},
  command = ":Format",
})
