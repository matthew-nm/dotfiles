require('navigator').setup({
  mason = true,
})

-- make work with cmp
if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
  require'cmp'.setup.buffer { completion = {enable = false} }
end
