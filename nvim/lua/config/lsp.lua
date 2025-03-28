----- Configure LSP -----
local lsp = require('lsp-zero')

lsp.on_attach(function(_, bufnr)
  -- map default keys
  lsp.default_keymaps({ buffer = bufnr })

  -- map Telescope keys
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', { buffer = bufnr })
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })

  -- show code hints in floating window on hover
  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,
    callback = function()
      -- return if floating window already open
      for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_win_get_config(winid).zindex then
          return
        end
      end
      -- open floating diagnostic
      local opts = {
        focusable = false,
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
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


-- hide inline code hints
vim.diagnostic.config({
  virtual_text = false,
})

-- add border to lspconfig windows
require('lspconfig.ui.windows').default_options.border = 'rounded'

-- add border to lsp floating windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = 'rounded'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


----- Configure Mason -----
require('mason').setup({
  ui = {
    border = 'single',
  },
})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    ['lua_ls'] = function()
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {'vim'}
            }
          }
        }
      })
    end,
    ['omnisharp'] = function()
      require('netcoredbg-macOS-arm64').setup(require('dap'))
      require("csharp").setup()
    end,
  },
  ensure_installed = {
    'bashls',
    'cssls',
    'htmx',
    'lua_ls',
    'omnisharp', -- c#
    'pyright',
    -- 'superhtml',
    'ts_ls', -- typescript, javascript
  },
})


----- Configure Formatter -----
require("formatter").setup({
  filetype = {
    python = {
      require("formatter.filetypes.python").black
    },
    cs = {
      require("formatter.filetypes.cs").csharpier
    },
  }
})


----- Configure CMP -----
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})
