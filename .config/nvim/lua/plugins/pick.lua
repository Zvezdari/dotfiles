local function telescope_shorten(path, shorten)
  shorten = shorten or 3
  path = path:gsub("\\", "/")
  if vim.env.HOME and vim.startswith(path, vim.env.HOME) then
    path = "~" .. path:sub(#vim.env.HOME + 1)
  end
  local parts = vim.split(path, "/", {trimempty = true})
  local n = #parts
  for i = 1, n - 1 do
    if shorten > 0 and parts[i] ~= "" then
      local name = parts[i]
      if name:sub(1,1) == "." and #name > 1 then
        parts[i] = name:sub(1,2)
      else
        parts[i] = name:sub(1,1)
      end
      shorten = shorten - 1
    end
  end
  return table.concat(parts, "/")
end

-- Extract value from item chosen in specified picker
local function extract_item_value(item)
  -- for command picker
  if type(item) == "string" then
    return item
  end

  if type(item) == "table" then
    -- for file-related picker
    if item.path then
      return item.path
    end

    -- for registers picker
    if item.content then
      return item.content
    end

    -- other pickers

    -- fallback: return the string representation of the table to avoid nil
    return vim.inspect(item)
  end

  return tostring(item)
end

return {
  'nvim-mini/mini.pick',
  version = false,
  config = function ()
    require('mini.pick').setup({
      window = {
        config = {
          border = 'rounded',
        }
      },
      mappings = {
        caret_left   = '<C-b>',
        caret_right  = '<C-f>',

        delete_char  = '<C-h>',

        scroll_down  = '<M-j>',
        scroll_up    = '<M-k>',
        scroll_left  = '<M-h>',
        scroll_right = '<M-l>',

        copy_to_clipboard = {
          char = '<M-c>',
          func = function ()
            local matches = MiniPick.get_picker_matches()
            local item = matches and matches.current
            if item then
              local content = extract_item_value(item)
              vim.fn.setreg('+', content)
              vim.notify('Copied to system clipboard', vim.log.levels.INFO)
              return true -- close picker after copied
            end
          end,
        },

        split_open = {
          char = '<C-o>',
          func = function ()
            local selected = MiniPick.get_picker_matches()
            local item = selected and selected.current
            if item then
              local content = extract_item_value(item)
              vim.cmd('split' .. content)
              return true -- close picker after copied
            end
          end
        },
        vsplit_open = {
          char = '<M-o>',
          func = function ()
            local selected = MiniPick.get_picker_matches()
            local item = selected and selected.current
            if item then
              local content = extract_item_value(item)
              vim.cmd('vsplit' .. content)
              return true -- close picker after copied
            end
          end
        },
      }
    })
    require('mini.pick').registry.oldfiles = function()
      local shorten_level = 3
      local files = vim.tbl_filter(function (p)
        return vim.fn.filereadable(p) == 1
      end, vim.v.oldfiles or {})
      local items = vim.tbl_map(function (p)
        return {
          path = p,
          text = telescope_shorten(p, shorten_level)
        }
      end, files)
      require('mini.pick').start({
        source = {
          items = items,
          name = "oldfiles",
          show = function (buf_id, show_items, query)
            require('mini.pick').default_show(buf_id, show_items, query, { show_icons = true })
          end
        }
      })
    end
    require('mini.pick').registry.config = function ()
      local path = vim.fn.stdpath('config')
      local all_files = vim.fn.globpath(path, '**/*', true, true)
      local files = {}
      for _, file in ipairs(all_files) do
        if file ~= '' and vim.fn.isdirectory(file) == 0 then
          table.insert(files, file)
        end
      end
      local items = vim.tbl_map(function (p)
        return {
          path = p,
          text = telescope_shorten(p, 3)
        }
      end, files)
      require('mini.pick').start({
        source = {
          items = items,
          name = "config",
          show = function (buf_id, show_items, query)
            require('mini.pick').default_show(buf_id, show_items, query, { show_icons = true })
          end
        }
      })
    end
  end
}
