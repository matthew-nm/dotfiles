require('telescope').load_extension('fzf') -- enable fzf

require('yanky').setup() -- init yanky
require('telescope').load_extension('yank_history') -- enable yanky

-- configure undo
require('telescope').setup({
  extensions = {
    undo = {
      side_by_side = true,
      layout_strategy = 'vertical',
      layout_config = { preview_height = 0.7 },
      vim_diff_opts = { ctxlen = 0 },
      entry_format = 'state #$ID, $STAT, $TIME',
      time_format = '',
      mappings = {
        i = {
          ['<CR>'] = require('telescope-undo.actions').restore,
          ['<C-a>'] = require('telescope-undo.actions').yank_additions,
          ['<C-d>'] = require('telescope-undo.actions').yank_deletions,
        },
      },
    },
  }
})
require('telescope').load_extension('undo')

-- configure preview
require('telescope').setup({
  defaults = {
    preview = {
      check_mime_type = true,
      filesize_limit = 8,
      timeout = 250,
      treesitter = true,
    }
  }
})
