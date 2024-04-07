require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
  window = {
    mappings = {
      ['V'] = 'open_split',
      ['v'] = 'open_vsplit',
      ['Z'] = 'expand_all_nodes',
    },
  },
}
