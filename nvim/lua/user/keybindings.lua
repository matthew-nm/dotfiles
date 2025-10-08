function Map(mode, lhs, rhs, opts)
  local options = {noremap=true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end


----- Editor -----

Map('n', '<Leader>w', ':w<CR>') -- save

Map('n', '<Leader>q', ':qa<CR>') -- quit all
Map('n', '<Leader>Q', ':qa!<CR>') -- quit all, force

Map('n', '<Leader>h', ':hide<CR>') -- hide buffer
Map('n', '<Leader>d', ':bw<CR>') -- delete buffer
Map('n', '<Leader>D', ':bw!<CR>') -- delete buffer, force
Map('n', '<Leader>ch', ':call DeleteHiddenBuffers()<CR>') -- delete hidden buffers
Map('n', '<Leader>ct', ':tabclose<CR>') -- close tab
Map('n', '<Leader>cT', ':windo bd<CR>') -- close tab and delete buffers
Map('n', '<Leader>ca', ':%bd<CR>', {silent=true}) -- delete all buffers

Map('n', 'k', 'gk') -- move with wrapped lines
Map('n', 'j', 'gj')
Map('n', 'K', '<C-y>') -- move screen
Map('n', 'J', '<C-e>')

Map('n', '<C-w>V', '<C-w>H') -- change vertical splits to horizontal
Map('n', '<C-w>H', '<C-w>K') -- change horizontal splits to vertical

Map('i', 'jj', '<ESC>') -- jj to exit insert mode

Map('n', '<A-;>', 'A;<ESC>') -- append ; to line
Map('i', ';;', '<END>;<ESC>') -- append ; to line
Map('n', '<A-,>', 'A,<ESC>') -- append , to line
Map('i', ',,', '<END>,<ESC>') -- append , to line
Map('n', '<A-.>', 'A.<ESC>') -- append . to line

Map('n', '<Leader>v', ':vsplit<CR>')  -- vertical split
Map('n', '<Leader>V', ':split<CR>')  -- horizontal split

Map('n', '<Leader>t', ':tabnew<CR>') -- new tab
Map('n', '<Leader>T', ':-1tabnew<CR>') -- new tab (behind)

Map('n', 'z1', ':set foldlevel=1<CR>') -- set fold level
Map('n', 'z2', ':set foldlevel=2<CR>')
Map('n', '<Leader>z', 'zA') -- toggle fold all

Map('n', '<Space>', [[/\c]]) -- space for case-insensitive search
Map('n', '<Space><Space>', [[/\<\><Left><Left>]]) -- space space for word search
Map('n', '<Leader><Space>', ':nohlsearch<CR>', {silent=true}) -- disable highlighting

Map('v', '<C-c>', [[ "+y ]]) -- Ctrl+c copy to system clipboard

Map('n', '<A-/>', ':Telescope keymaps<CR>')  -- View all keybindings


----- Tools -----

-- Worktrees
Map('n', 'Ws', function() require('worktrees').switch(false) end)
Map('n', 'Wc', ':WorktreeCreate<CR>')
Map('n', 'Wd', ':WorktreeDelete<CR>')

-- DAP Debugger
local function dapSetConditionalBreakpoint()
  vim.ui.input(
    { prompt="Breakpoint condition: " },
    function(input)
      require('dap').set_breakpoint(input)
    end
  )
end
-- dap
Map('n', '<M-b>', function() require('dap').toggle_breakpoint() end)
Map('n', '<M-B>', function() dapSetConditionalBreakpoint() end)
Map('n', '<M-Up>', function() require('dap').step_out() end)
Map('n', '<M-Down>', function() require('dap').step_into() end)
Map('n', '<M-Left>', ':DapRestartFrame<CR>')
Map('n', '<M-Right>', function() require('dap').step_over() end)
Map('n', '<M-c>', function() require('dap').continue() end)
Map('n', '<M-d>c', ':DapClearBreakpoints<CR>')
Map('n', '<M-d>x', ':DapTerminate<CR>')
Map('n', '<M-r>', ':DapToggleRepl<CR>')
-- dap-ui
Map('n', '<M-u>', function() require('dapui').toggle() end)

-- Vim-Test
Map('n', '<C-t>', ':TestNearest<CR>')
Map('n', 'Tt', ':TestNearest<CR>')
Map('n', 'Ts', ':TestFile<CR>')
Map('n', 'Ta', ':TestSuite<CR>')
Map('n', 'Tl', ':TestLast<CR>')
Map('n', 'Tg', ':TestVisit<CR>')

-- Neotree
Map('n', '<Leader>e', ':Neotree left toggle<CR>', {silent=true}) -- toggle file explorer
Map('n', '<Leader>E', ':Neotree left<CR>', {silent=true}) -- open/move to file explorer
Map('n', '-', ':Neotree float toggle<CR>', {silent=true}) -- toggle floating file explorer
Map('n', '<Leader>b', ':Neotree buffers left toggle<CR>', {silent=true}) -- toggle buffer explorer

-- Telescope
Map('n', '<Leader>f', ':Telescope find_files<CR>', {silent=true}) -- search for file
Map('n', '<Leader>g', ':Telescope live_grep<CR>', {silent=true}) -- search for word
Map('n', '<Leader>u', ':Telescope undo<CR>', {silent=true}) -- view undo history

-- Yanky
Map({'n','x'}, 'p', '<Plug>(YankyPutAfter)') -- put
Map({'n','x'}, 'P', '<Plug>(YankyPutBefore)')
Map({'n','x'}, 'mp', '<Plug>(YankyGPutAfter)') -- put and move
Map({'n','x'}, 'mP', '<Plug>(YankyGPutBefore)')
Map('n', '<C-n>', '<Plug>(YankyCycleForward)')
Map('n', '<C-p>', '<Plug>(YankyCycleBackward)')

-- Surround
Map('n', '<leader>sw', '<leader>saiw', {remap = true})
Map('n', '<leader>sW', '<leader>saiW', {remap = true})

local qoutes = { "'", '"', '`' }
for _, char in ipairs(qoutes) do
	Map('n', '<leader>' .. char, '<leader>srq' .. char, {remap = true}) -- <leader>{char} to replace sandwich to {char}
end

-- Todo Comments
Map('n', ']t', require('todo-comments').jump_next, {desc = 'Next todo comment'})
Map('n', '[t', require('todo-comments').jump_prev, {desc = 'Previous todo comment'})
