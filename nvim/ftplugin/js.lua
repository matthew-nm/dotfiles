-- Autocommands
local augroup = vim.api.nvim_create_augroup('js', {})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = augroup,
  pattern = {'*.js'},
  callback = function()
    vim.lsp.buf.format()
  end,
})
