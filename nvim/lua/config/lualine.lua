require('colors')
require('lsp-progress').setup()

require('lualine').setup({
  options = {
    disabled_filetypes = {
      'neo-tree',
      'vista',
    },
    icons_enabled = true,
    component_separators = {left = '\\', right = '/'},
    section_separators = {left = '', right = ''},
    -- component_separators = {left = '', right = ''},
    -- section_separators = {left = '', right = ''},
    -- component_separators = {left = '', right = ''},
    -- section_separators = {left = '', right = ''},
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {'diff', diff_color = {
        added = {fg=Colors.gitAdd},
        modified = {fg=Colors.gitChange},
        removed = {fg=Colors.gitDelete},
      }},
      'diagnostics',
    },
    lualine_c = {'filename'},
    lualine_x = {
      function()
        return require('lsp-progress').progress()
      end,
      -- 'encoding',
      -- 'fileformat',
      'filetype',
    },
    lualine_y = {},
    lualine_z = {'progress'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
