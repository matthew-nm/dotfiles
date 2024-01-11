require'lspconfig'.dartls.setup{
  cmd = { "dart", 'language-server', '--protocol=lsp' },
  single_file_support = true,
}
