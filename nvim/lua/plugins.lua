local plugins = {

  -- Theme
  {'nvim-tree/nvim-web-devicons'}, -- icons, for various
  {'nvim-lualine/lualine.nvim', -- status line
    dependencies = {'linrongbin16/lsp-progress.nvim'}
  },
  {'mhartington/oceanic-next'}, -- editor theme
  {'folke/tokyonight.nvim'}, -- editor theme

  -- LSP
  {'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim', build = ':MasonUpdate'},
      {'williamboman/mason-lspconfig.nvim'},
      -- autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'L3MON4D3/LuaSnip'},
      {'saadparwaiz1/cmp_luasnip'},
      -- configuration
      {'mhartington/formatter.nvim'},
    }
  },

  -- Treesitter
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'}, -- syntax engine
  {'HiPhish/rainbow-delimiters.nvim'}, -- colorize ({[]})

  -- Testing
  {'vim-test/vim-test'}, -- testing engine

  -- Navigation
  {'alexghergh/nvim-tmux-navigation'}, -- keyboard nav, nvim + tmux
  {'nvim-neo-tree/neo-tree.nvim', -- file explorer
    branch = 'v3.x',
    dependencies = {'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'}
  },
  {'nvim-telescope/telescope.nvim', -- find words/files/etc.
    branch = 'master',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
      'gbprod/yanky.nvim',
      'debugloop/telescope-undo.nvim'
    }
  },

  -- Editor
  {'tpope/vim-fugitive'}, -- git commands
  {'lewis6991/gitsigns.nvim'}, -- show git status in signcolumn
  {'junkblocker/git-time-lapse'}, -- navigate git history of file
  {'liuchengxu/vista.vim'}, -- view code structure in a sidebar
  {'numToStr/Comment.nvim'}, -- easily comment lines of code
  {'kylechui/nvim-surround'}, -- easily surround text
  {'rcarriga/nvim-notify'},
  {'cohama/lexima.vim'}, -- automatically pair ([{' etc.
  {'gabrielpoca/replacer.nvim'}, -- edit quickfix and save changes
  {'norcalli/nvim-colorizer.lua'}, -- colorize color codes
  {'ntpeters/vim-better-whitespace'}, -- highlight whitespace and end of lines
  {'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {}}, -- view line indents
  { -- highlight and jump to todo, fixme, etc.
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {'rmagatti/goto-preview'}, -- preview LSP actions in floating windows
  {'stevearc/resession.nvim'}, -- save/load sessions
  { -- numbers as text objects
    'tkhren/vim-textobj-numeral',
    dependencies = { 'kana/vim-textobj-user' },
  },
  {'stevearc/dressing.nvim'}, -- nicer user inputs
  {'wellle/targets.vim'}, -- improved text objects

  -- Language tools
  --- Flutter / Dart
  {
    'akinsho/flutter-tools.nvim', -- tools for Flutter
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = true,
  },
  {'f-person/pubspec-assist-nvim'}, -- dependency assistant
  --- C#
  {
    "iabdelkareem/csharp.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "Tastyep/structlog.nvim",
      "Cliffback/netcoredbg-macOS-arm64.nvim",
    },
  },

  -- Snippets
  {'rafamadriz/friendly-snippets'}, -- multi-language snippets
  {'J0rgeSerran0/vscode-csharp-snippets'}, -- C#, general
  {'Nash0x7E2/awesome-flutter-snippets'}, -- Flutter, general
  {'ArkrootHQ/freezed-snippets'}, -- Flutter, `freezed` package
  {'RobertBrunhage/flutter-riverpod-snippets'}, -- Flutter, `riverpod` package

}


local opts = {
  ui = {border='single'}
}

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
--

require('lazy').setup(plugins, opts)
