require('telescope').setup({
  defaults = {
    path_display = {
      filename_first = {
        reverse_directories = false,
      },
    },
    preview = {
      check_mime_type = true,
      filesize_limit = 8,
      timeout = 250,
      treesitter = true,
    }
  },
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

-- load extensions
require('telescope').load_extension('fzf')

require('telescope').load_extension('undo')

require('yanky').setup()
require('telescope').load_extension('yank_history')
