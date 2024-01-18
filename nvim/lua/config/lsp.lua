----- Configure LSP -----
local lsp = require('lsp-zero').preset({
  manage_nvim_cmp = {
    set_extra_mappings = true,
  }
})

lsp.on_attach(function(client, bufnr)

  lsp.default_keymaps({buffer = bufnr}) -- map default keys

  vim.api.nvim_create_autocmd("CursorHold", { -- show code hints in floating window
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })
end)

lsp.setup()


vim.diagnostic.config({ -- hide inline code hints
	virtual_text = false,
})


----- Configure CMP -----
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})
