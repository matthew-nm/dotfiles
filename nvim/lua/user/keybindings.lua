local function map(mode, lhs, rhs, opts)
    local options = {noremap=true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end


----- Editor keybindings -----

map('n', '<Leader>w', ':w<CR>') -- save

map('n', '<Leader>q', ':qa<CR>') -- quit all
map('n', '<Leader>Q', ':qa!<CR>') -- quit all, force

map('n', '<Leader>h', ':hide<CR>') -- hide buffer
map('n', '<Leader>d', ':bw<CR>') -- delete buffer
map('n', '<Leader>c', ':call CloseHiddenBuffers()<CR>') -- close hidden buffers
map('n', '<Leader>C', ':%bd<CR>', {silent=true}) -- close all buffers

map('n', 'k', 'gk') -- move with wrapped lines
map('n', 'j', 'gj')
map('n', 'K', 'gk')
map('n', 'J', 'gj')

map('i', 'jj', '<ESC>') -- jj to exit insert mode

map('n', '<Leader>v', ':vsplit<CR>')  -- vertical split
map('n', '<Leader>V', ':split<CR>')  -- horizontal split

map('n', '<Leader>t', ':tabnew<CR>') -- new tab
map('n', '<Leader>T', ':-1tabnew<CR>') -- new tab (behind)

map('n', 'z1', ':set foldlevel=1<CR>') -- set fold level
map('n', 'z2', ':set foldlevel=2<CR>')
map('n', '<Leader>z', 'zA') -- toggle fold all

map('n', '<Space>', [[/\c]]) -- space for case-insensitive search
map('n', '<Space><Space>', [[/\<\><Left><Left>]]) -- space space for word search
map('n', '<Leader><Space>', ':nohlsearch<CR>', {silent=true}) -- disable highlighting

map('v', '<C-c>', [["+y]]) -- Ctrl+c copy to system clipboard


----- Tools -----

-- Neotree
map('n', '<Leader>e', ':Neotree left toggle<CR>', {silent=true}) -- toggle file explorer
map('n', '-', ':Neotree float toggle<CR>', {silent=true}) -- toggle floating file explorer
map('n', '<Leader>b', ':Neotree buffers left toggle<CR>', {silent=true}) -- toggle buffer explorer

-- Telescope
map('n', '<Leader>f', ':Telescope find_files<CR>', {silent=true}) -- search for file
map('n', '<Leader>g', ':Telescope live_grep<CR>', {silent=true}) -- search for word
map('n', '<Leader>u', ':Telescope undo<CR>', {silent=true}) -- view undo history

-- Yanky
map({'n','x'}, 'p', '<Plug>(YankyPutAfter)') -- enable yanky yank ring
map({'n','x'}, 'P', '<Plug>(YankyPutBefore)')
map({'n','x'}, 'gp', '<Plug>(YankyGPutAfter)')
map({'n','x'}, 'gP', '<Plug>(YankyGPutBefore)')
map('n', '<C-n>', '<Plug>(YankyCycleForward)')
map('n', '<C-p>', '<Plug>(YankyCycleBackward)')

-- Surround
map('n', '<leader>sw', '<leader>saiw', {remap = true})
map('n', '<leader>sW', '<leader>saiW', {remap = true})

local qoutes = { "'", '"', '`' }
for _, char in ipairs(qoutes) do
	map('n', "<leader>" .. char, '<leader>srq' .. char, {remap = true}) -- <leader>{char} to replace sandwich to {char}
end
