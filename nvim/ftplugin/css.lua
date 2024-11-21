-- Autocommands
local augroup = vim.api.nvim_create_augroup('css', {})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = augroup,
  pattern = {'*.css'},
  callback = function()
    vim.lsp.buf.format()
  end,
})
