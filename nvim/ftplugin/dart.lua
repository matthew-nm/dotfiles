-- Flutter-Tools
Map('n', 'Lo', ':FlutterOutlineToggle<CR>', {silent=true, buffer=true}) -- show code outline
Map('n', 'Lc', ':Telescope flutter commands<CR>', {silent=true, buffer=true}) -- show flutter commands via Telescope

-- Pubspec Assist
Map('n', 'Ld', ':PubspecAssistAddDependency ') -- add regular dependency
Map('n', 'LD', ':PubspecAssistAddDevDependency ') -- add dev dependency

-- Autocommands
local agId = vim.api.nvim_create_augroup('dart', {})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = agId,
  pattern = {'*.dart'},
  callback = function()
    vim.lsp.buf.format()
  end,
})
