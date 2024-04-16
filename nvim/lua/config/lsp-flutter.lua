local lsp_zero = require('lsp-zero')

require('flutter-tools').setup({
  lsp = {
    capabilities = lsp_zero.get_capabilities(),
    color = {
      enabled = true,
    },
  },
})
