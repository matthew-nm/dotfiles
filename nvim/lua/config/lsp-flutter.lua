local lsp_zero = require('lsp-zero')

require('flutter-tools').setup({
  fvm = true,
  lsp = {
    capabilities = lsp_zero.get_capabilities(),
    color = {
      enabled = true,
    },
  },
})
