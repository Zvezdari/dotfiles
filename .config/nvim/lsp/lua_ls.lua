local root_markers1 = {
  '.emmyrc.json',
  '.luarc.json',
  '.luarc.jsonc',
}
local root_markers2 = {
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
}

---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { root_markers1, root_markers2, { '.git' } },  -- 识别项目根目录
  ---@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      codeLens = { enable = true }, -- 显示引用计数，运行测试等内容
      hint = { enable = true, semicolon = 'Disable' },  -- 启用内联提示，semicolon为分号提示，disable表示不要求句末分号
    },
  },
}
