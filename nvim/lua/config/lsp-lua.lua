require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
	      globals = {'vim'}
      }
    }
  }
})

require('lspconfig.ui.windows').default_options = {
  border = 'single'
}
