vim.api.nvim_create_user_command(
  'EditQuickfix',
  require('replacer').run,
  {nargs = 0}
)
