-- Editor
vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd[[highlight ExtraWhitespace guibg=#990000]]


-- Statusline
require'lualine'.setup{
  options = {
    theme = 'tokyonight'
  }
}

-- Rainbow Delimiters
vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', {fg = '#85d152'})
