local resession = require('resession')

resession.setup()

vim.keymap.set('n', '<leader>Ss', resession.save)
vim.keymap.set('n', '<leader>Sl', resession.load)
vim.keymap.set('n', '<leader>Sd', resession.delete)
