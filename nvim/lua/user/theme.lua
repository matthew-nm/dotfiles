require('colors')

require("tokyonight").setup({
  on_colors = function(colors)
    colors.error = "#cc3131"
    colors.comment = "#7c87c4"
    colors.fg_gutter = "#50567a"
  end
})

-- Editor
vim.cmd[[colorscheme tokyonight-moon]]
vim.api.nvim_set_hl(0, 'ExtraWhitespace', {bg='#991111'})
vim.api.nvim_set_hl(0, 'Todo', {bold=true})
vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', {fg = '#7079b5', underline=true})

-- Statusline
require'lualine'.setup{
  options = {
    theme = 'tokyonight'
  }
}

-- GitSigns
vim.api.nvim_set_hl(0, 'GitSignsAdd', {fg = Colors.gitAdd})
vim.api.nvim_set_hl(0, 'GitSignsChange', {fg = Colors.gitChange})
vim.api.nvim_set_hl(0, 'GitSignsDelete', {fg = Colors.gitDelete})

-- Rainbow Delimiters
vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', {fg = '#9dc96d'})

-- NeoTree
vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', {link = 'MsgArea'})
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', {fg = Colors.gitChange})
