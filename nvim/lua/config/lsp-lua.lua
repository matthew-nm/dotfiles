require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
	      globals = {'vim'}
      }
    }
  }
})

-- add border to lsp floating windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = 'rounded'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
