vim.o.tabstop = 4;

-- Autocommands
local augroup = vim.api.nvim_create_augroup('html', {})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = augroup,
  pattern = {'*.html', '*.cshtml'},
  callback = function()
    vim.lsp.buf.format()
  end,
})
