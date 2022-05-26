" ----- PLUGINS via `vim-plug` ----- "

" run `vim-plug` in terminal to install manager

" run the following within vim:
"   PlugInstall
"   PlugUpdate
"   PlugClean
"   PlugUpgrade

call plug#begin()
"Plug 'user/repo', 'branch_or_tag'

" General
Plug 'luochen1990/rainbow'  " rainbow parentheses
Plug 'vim-scripts/ShowTrailingWhitespace'  " show red when line ends in whitespace
Plug 'Yggdroot/indentLine'  " show line indentations
Plug 'mbbill/undotree'  " show branching history
Plug 'vim-scripts/YankRing.vim'  " show yank history
Plug 'tpope/vim-characterize'  " more character info on 'ga'
Plug 'tpope/vim-surround'  " surround text with characters or tags

" Themes
Plug 'Dru89/vim-adventurous'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'lspcontainers/lspcontainers.nvim'

" nvim.cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Tmux
Plug 'christoomey/vim-tmux-navigator'  " navigate between vim and tmux


" ----- Languages / Frameworks ----- "

" Flutter / Dart
Plug 'dart-lang/dart-vim-plugin'  " dart language syntax
Plug 'reisub0/hot-reload.vim'  " hot-reload on save

" Haskell
Plug 'neovimhaskell/haskell-vim'  " haskell language syntax

" Markdown
Plug 'plasticboy/vim-markdown'  " markdown language syntax

" Python
Plug 'vim-python/python-syntax'  " python language syntax
Plug 'tmhedberg/SimpylFold'  " enable folding python code

" SQL
Plug 'magicalbanana/sql-syntax-vim'  " sql language syntax

call plug#end()


" -------------------------- "
" ----- CONFIGURATIONS ----- "
" -------------------------- "


" ----- LSP + cmp ----- "

set completeopt=menu,menuone,noselect

lua << EOF
  -- Setup nvim-cmp.
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local luasnip = require("luasnip")
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


-- Configure LSP

util = require 'lspconfig/util'

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Configure language servers
-- Python
require'lspconfig'.pyright.setup {
  before_init = function(params)
    params.processId = vim.NIL
  end,
  cmd = require'lspcontainers'.command('pyright'),
  root_dir = util.root_pattern(".git", vim.fn.getcwd()),
  on_attach = on_attach,
  capabilities = capabilities,
}
EOF


" ----- nvim.cmp ----- "

" set completeopt=menu,menuone,noselect
"
" lua <<EOF
"   -- Setup nvim-cmp.
"   local cmp = require'cmp'
"
"   cmp.setup({
"     snippet = {
"       -- REQUIRED - you must specify a snippet engine
"       expand = function(args)
"         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
"       end,
"     },
"     mapping = {
"       ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
"       ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
"       ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
"       ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
"       ['<C-e>'] = cmp.mapping({
"         i = cmp.mapping.abort(),
"         c = cmp.mapping.close(),
"       }),
"       ['<CR>'] = cmp.mapping.confirm({ select = true }),
"     },
"     sources = cmp.config.sources({
"       { name = 'nvim_lsp' },
"       { name = 'luasnip' }, -- For luasnip users.
"     }, {
"       { name = 'buffer' },
"     })
"   })
"
"   -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
"   cmp.setup.cmdline('/', {
"     sources = {
"       { name = 'buffer' }
"     }
"   })
"
"   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
"   cmp.setup.cmdline(':', {
"     sources = cmp.config.sources({
"       { name = 'path' }
"     }, {
"       { name = 'cmdline' }
"     })
"   })
"
"   -- Setup lspconfig.
"   local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
"   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
"   require('lspconfig')['pylsp'].setup {
"     capabilities = capabilities
"   }
" EOF


" ----- indentLine ----- "

let g:indentLine_char = '│'
let g:indentLine_color_term = 238
let g:indentLine_fileTypeExclude = ['fzf','json','markdown']


" ----- Markdown sytnax ----- "

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1


" ----- Python-Syntax ----- "

let g:python_highlight_all = 1


" ----- rainbow ----- "

let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\}


" ----- SimpylFold ----- "

let g:SimpylFold_fold_import = 0
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_docstring_preview = 1


" ----- vim-tmux-navigator ----- "

" Disable tmux navigator when tmux is zoomed on the vim pane
let g:tmux_navigator_disable_when_zoomed = 1
