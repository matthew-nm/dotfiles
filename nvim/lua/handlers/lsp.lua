-- stolen from: https://github.com/ViRu-ThE-ViRuS/configs/blob/master/nvim/lua/lsp-setup/handlers.lua
local notify = require('notify')

local function foreach(tbl, f, only_values)
  if not tbl then return {} end

  local t = {}
  if only_values then
    for key, value in pairs(tbl) do table.insert(t, f(key, value)) end
  else
    for key, value in pairs(tbl) do t[key] = f(key, value) end
  end
  return t
end

local function filter(tbl, f, keep_keys)
  if not tbl or tbl == {} then return {} end

  local t = {}

  local insert = function(key, value)
    if keep_keys then
      t[key] = value
    else
      table.insert(t, value)
    end
  end

  for key, value in pairs(tbl) do
    if f(key, value) then insert(key, value) end
  end

  return t
end

local function get_visible_qflists()
  return filter(
    vim.api.nvim_tabpage_list_wins(0),
    function(_, winnr) return vim.fn.getwininfo(winnr)[1].quickfix == 1 end
  )
end

-- set qflist and open
local function qf_populate(lines, opts)
  if not lines or #lines == 0 then return end

  opts = vim.tbl_deep_extend('force', {
    simple_list = false,
    mode = "r",
    title = nil,
    scroll_to_end = false,
  }, opts or {})

  -- convenience implementation, set qf directly from values
  if opts.simple_list then
    lines = foreach(lines, function(_, item)
      -- set default file loc to 1:1
      return { filename = item, lnum = 1, col = 1, text = item }
    end)
  end

  -- close any prior lists visible in current tab
  if not vim.tbl_isempty(get_visible_qflists()) then
    vim.cmd [[ cclose ]]
  end

  vim.fn.setqflist(lines, opts.mode)

  -- ux
  local commands = table.concat({
    'horizontal copen',
    (opts.scroll_to_end and 'normal! G') or "",
    -- (opts.title and require('statusline').set_statusline_cmd(opts.title)) or "",
    'wincmd p',
  }, '\n')

  vim.cmd(commands)
end

local function qf_rename()
  local position_params = vim.lsp.util.make_position_params()
  position_params.oldName = vim.fn.expand("<cword>")

  vim.ui.input({ prompt = 'rename to> ', default = position_params.oldName }, function(input)
    -- exit no changes
    if input == nil then
      notify('aborted', 'warn', { title = '[LSP] rename', render = 'compact' })
      return
    end

    position_params.newName = input
    vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, result, ctx, config)
      -- result not provided, error at lsp end
      -- no changes made
      if not result or (not result.documentChanges and not result.changes) then
        notify(
          string.format(
            'could not perform rename: %s -> %s',
            position_params.oldName,
            position_params.newName
          ),
          'error',
          { title = '[LSP] rename', timeout = 500 }
        )

        return
      end

      -- apply changes
      vim.lsp.handlers["textDocument/rename"](err, result, ctx, config)

      local notification, entries = {}, {}
      local num_files, num_updates = 0, 0

      -- collect changes
      if result.documentChanges then
        for _, document in pairs(result.documentChanges) do
          num_files = num_files + 1
          local uri = document.textDocument.uri
          local bufnr = vim.uri_to_bufnr(uri)

          for _, edit in ipairs(document.edits) do
            local start_line = edit.range.start.line + 1
            local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

            table.insert(entries, {
              bufnr = bufnr,
              lnum = start_line,
              col = edit.range.start.character + 1,
              text = line
            })
          end

          num_updates = num_updates + vim.tbl_count(document.edits)

          local short_uri = string.sub(vim.uri_to_fname(uri), #vim.loop.cwd() + 2)
          table.insert(
            notification,
            string.format('\t- %d in %s', vim.tbl_count(document.edits), short_uri)
          )
        end
      end

      -- collect changes
      if result.changes then
        for uri, edits in pairs(result.changes) do
          num_files = num_files + 1
          local bufnr = vim.uri_to_bufnr(uri)

          for _, edit in ipairs(edits) do
            local start_line = edit.range.start.line + 1
            local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

            table.insert(entries, {
              bufnr = bufnr,
              lnum = start_line,
              col = edit.range.start.character + 1,
              text = line
            })
          end

          num_updates = num_updates + vim.tbl_count(edits)

          local short_uri = string.sub(vim.uri_to_fname(uri), #vim.loop.cwd() + 2)
          table.insert(
            notification,
            string.format('\t- %d in %s', vim.tbl_count(edits), short_uri)
          )
        end
      end

      -- format notification header and content
      local notification_str = ''
      if num_files > 1 then
        -- add header
        table.insert(notification, 1, string.format(
          'made %d change%s in %d files',
          num_updates,
          (num_updates > 1 and "s") or "",
          num_files
        ))

        notification_str = table.concat(notification, '\n')
      else
        -- only 1 entry in notification table for the single file
        notification_str = string.format('made %s', notification[1]:sub(4))

        -- add word "change"/"changes" at this point
        local insert_loc = notification_str:find('in')

        notification_str = table.concat({
          notification_str:sub(1, insert_loc - 1),
          string.format('change%s ', (num_updates > 1 and "s") or ""),
          notification_str:sub(insert_loc)
        }, '')
      end

      notify(notification_str, 'info', {
        title = string.format(
          '[LSP] rename: %s -> %s',
          position_params.oldName,
          position_params.newName
        ),
        timeout = 2500,
      })

      -- set qflist if more than 1 file
      if num_files > 1 then
        qf_populate(entries, { title = "Applied Changes" })
        vim.cmd[[echo "Use `:cfdo w` to save changes"]]
      end
    end)
  end)
end
vim.lsp.buf.rename = qf_rename
