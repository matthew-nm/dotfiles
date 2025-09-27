require('worktrees').setup({
  opts = {
    -- base_path = "..",  -- Parent directory of common dir
    -- path_template = "{branch}",  -- Default: use branch name
    commands = {
      create = "WorktreeCreate",
      delete = "WorktreeDelete",
      switch = "WorktreeSwitch",
    },
    -- mappings = {
    --   create = "Wc",
    --   delete = "Wd",
    --   switch = "Ws",
    -- }
  }
})
