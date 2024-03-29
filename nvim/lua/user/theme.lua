require("tokyonight").setup({
  on_colors = function(colors)
    colors.error = "#cc3131"
    colors.comment = "#7c87c4"
    colors.fg_gutter = "#50567a"
  end
})

-- Editor
vim.cmd[[colorscheme tokyonight-moon]]
vim.api.nvim_set_hl(0, 'ExtraWhitespace', {fg='#991111'})
vim.api.nvim_set_hl(0, 'Todo', {bold=true})

-- Statusline
require'lualine'.setup{
  options = {
    theme = 'tokyonight'
  }
}

-- Rainbow Delimiters
vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', {fg = '#9dc96d'})
