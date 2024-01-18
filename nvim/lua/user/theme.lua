-- Editor
vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd[[highlight ExtraWhitespace guibg=#990000]]


-- Statusline
require'lualine'.setup{
  options = {
    theme = 'tokyonight'
  }
}
