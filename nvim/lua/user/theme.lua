vim.o.background=dark
require('colors')

-- Editor
vim.g.gruvbox_italic=1
vim.cmd[[colorscheme gruvbox]]

clr_vimbg = '#0E1B24'
clr_neotreebg = '#0D1921'
clr_cursorlinebg = '#182C38'
clr_activebg = '#2A4B52'
clr_error = '#fb4934'

vim.api.nvim_set_hl(0, 'Normal', {bg=clr_vimbg})
vim.api.nvim_set_hl(0, 'SignColumn', {bg=clr_vimbg})
vim.api.nvim_set_hl(0, 'CursorLine', {bg=clr_cursorlinebg})
vim.api.nvim_set_hl(0, 'CursorLineNr', {bg=clr_cursorlinebg, fg='#D49653', bold=true})
vim.api.nvim_set_hl(0, 'WinSeparator', {fg=clr_neotreebg, bg=clr_vimbg})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg=clr_neotreebg})
vim.api.nvim_set_hl(0, 'FloatBorder', {bg=clr_neotreebg, fg=clr_activebg})
vim.api.nvim_set_hl(0, 'StatusLine', {link='WinSeparator'})
vim.api.nvim_set_hl(0, 'StatusLineNC', {link='WinSeparator'})
vim.api.nvim_set_hl(0, 'TabLine', {bg=clr_vimbg, fg='#7c6f64'})
vim.api.nvim_set_hl(0, 'TabLineSel', {bg=clr_vimbg, fg='#b8bb26'})
vim.api.nvim_set_hl(0, 'TabLineFill', {bg=clr_vimbg})

-- vim.api.nvim_set_hl(0, '@variable', {fg='#E8C9A5'})
-- vim.api.nvim_set_hl(0, '@property', {fg='#D49653'})
-- vim.api.nvim_set_hl(0, 'Function', {fg='#FFEAD4', bold=true})
-- vim.api.nvim_set_hl(0, 'Special', {fg='#3AB089', bold=true})
vim.api.nvim_set_hl(0, 'String', {fg='#e3c77e'})

vim.api.nvim_set_hl(0, 'ErrorMsg', {bg=clr_vimbg, fg=clr_error})
vim.api.nvim_set_hl(0, 'ExtraWhitespace', {bg='#991111'})
vim.api.nvim_set_hl(0, 'Todo', {bold=true})
-- vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', {fg = '#7079b5', underline=true})

-- Statusline
require'lualine'.setup{
  options = {
    theme = 'mattheme'
  }
}

-- GitSigns
vim.api.nvim_set_hl(0, 'GitSignsAdd', {fg = Colors.gitAdd})
vim.api.nvim_set_hl(0, 'GitSignsChange', {fg = Colors.gitChange})
vim.api.nvim_set_hl(0, 'GitSignsDelete', {fg = Colors.gitDelete})

-- Rainbow Delimiters
vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', {fg = '#9dc96d'})

-- NeoTree
-- vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', {link = 'MsgArea'})
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', {fg = Colors.gitChange})
vim.api.nvim_set_hl(0, 'NeoTreeNormal', {bg=clr_neotreebg})
vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', {link='NeoTreeNormal'})
