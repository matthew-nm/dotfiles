-- Close hidden buffers
vim.cmd([[
function CloseHiddenBuffers()
  let open_buffers = []
  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor
  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction
]])

-- Sudo write
vim.cmd([[
command! Sudow w !sudo tee % >/dev/null
]])

-- Show highlight group for symbol under cursor
vim.cmd([[
command! ShowHighlightGroup :call SynStack()
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
]])
