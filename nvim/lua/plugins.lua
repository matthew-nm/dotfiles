local plugins = {

  -- Theme
  {'nvim-tree/nvim-web-devicons'}, -- icons, for various
  {'nvim-lualine/lualine.nvim', -- status line
    dependencies = {'WhoIsSethDaniel/lualine-lsp-progress.nvim'}
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
      {'L3MON4D3/LuaSnip'},
    }
  },

  -- Treesitter
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'}, -- syntax engine
  -- {'HiPhish/rainbow-delimiters.nvim'}, -- colorize ({[]})
  {'ray-x/navigator.lua', -- navigate through source code
    dependencies = {'ray-x/guihua.lua', build = 'cd lua/fzy && make'},
  },

  -- Navigation
  {'alexghergh/nvim-tmux-navigation'}, -- keyboard nav, nvim + tmux
  {'nvim-neo-tree/neo-tree.nvim', -- file explorer
    branch = 'v3.x',
    dependencies = {'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'}
  },
  {'nvim-telescope/telescope.nvim', -- find words/files/etc.
    -- tag = '0.1.2',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
      'gbprod/yanky.nvim',
      'debugloop/telescope-undo.nvim'
    }
  },

  -- Editor
  {'vim-scripts/ShowTrailingWhitespace'}, -- highlight whitespace and end of lines
  {'tpope/vim-fugitive'}, -- git commands
  {'airblade/vim-gitgutter'}, -- show git status in signcolumn
  {'junkblocker/git-time-lapse'}, -- navigate git history of file
  {'liuchengxu/vista.vim'}, -- view code structure in a sidebar
  {'lukas-reineke/indent-blankline.nvim'}, -- view line indents
  {'numToStr/Comment.nvim'}, -- easily comment lines of code
  {'kylechui/nvim-surround'}, -- easily surround text
  {'cohama/lexima.vim'}, -- automatically pair ([{' etc.
  {'gabrielpoca/replacer.nvim'}, -- edit quickfix and save changes
  {'norcalli/nvim-colorizer.lua'}, -- colorize color codes

}


local opts = {
  ui = {
    border = 'single'
  }
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
