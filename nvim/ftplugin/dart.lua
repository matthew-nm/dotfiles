vim.o.tabstop = 2

-- Flutter-Tools
Map('n', 'Lo', ':FlutterOutlineToggle<CR>', {silent=true}) -- show code outline
Map('n', 'Lc', ':Telescope flutter commands<CR>', {silent=true}) -- show flutter commands via Telescope

-- Pubspec Assist
Map('n', 'Ld', ':PubspecAssistAddDependency ') -- add regular dependency
Map('n', 'LD', ':PubspecAssistAddDevDependency ') -- add dev dependency

-- Autocommands
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = {'*.dart'},
  callback = function()
    vim.lsp.buf.format()
  end,
})
