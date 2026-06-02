local pick = require("mini.pick")
local icons = require("mini.icons")

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

return {
  'nvim-mini/mini.pick',
  version = false,
  config = function ()
    require('mini.pick').setup({
      window = {
        config = {
          border = 'rounded',
        }
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
  end
}
