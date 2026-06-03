local M = {}
local valid_themes = {
  "catppuccin",
  "gruvbox-material",
}

local data_path = vim.fn.stdpath("data")
local vars_file = data_path .. "/user_variables.json"

function M.load()
  if vim.fn.filereadable(vars_file) == 0 then
    return {}
  end
  local readfileok, content = pcall(vim.fn.readfile, vars_file)
  if not readfileok or not content then
    return {}
  end
  local json_str = table.concat(content, "\n")
  local ok, decoded = pcall(vim.json.decode, json_str)
  if not ok then
    return {}
  end
  return decoded or {}
end

function M.save(data)
  local encoded = vim.json.encode(data)
  local ok, err = pcall(vim.fn.writefile, { encoded }, vars_file)
  if not ok then
    vim.notify(err, vim.log.levels.ERROR)
  end
end

function M.get_theme()
  local vars = M.load()
  return vars.THEME or "catppuccin"
end

function M.set_theme(theme_name)
  local vars = M.load()
  vars.THEME = theme_name
  M.save(vars)
end

vim.api.nvim_create_user_command("ThemeSwitch", function (opts)
  local new_theme = opts.args
  local num = tonumber(new_theme)

  if num and num >= 1 and num <= #valid_themes then
    new_theme = valid_themes[num]
  elseif not vim.tbl_contains(valid_themes, new_theme) then
    vim.notify("Invalid theme", vim.log.levels.ERROR)
    return
  end
  M.set_theme(new_theme)
  vim.notify("Theme is set, restart to apply", vim.log.levels.INFO)
end, { nargs = 1 })

return M
