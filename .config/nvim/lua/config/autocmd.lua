local augroup = vim.api.nvim_create_augroup('Autocommands', {})

local function au(event, pattern, callback, desc)
  vim.api.nvim_create_autocmd(event, {
    group = augroup,
    pattern = pattern,
    callback = callback,
    desc = desc,
  })
end

-- 高亮复制的文本
local function on_yank()
  vim.hl.on_yank()
end
au('TextYankPost', '*', on_yank, 'Highlight yanked text')

-- 打开终端时自动进入输入模式
local function start_terminal_insert(data)
  if vim.api.nvim_get_current_buf() == data.buf and vim.bo.buftype == 'terminal' then
    vim.schedule(function()
      vim.cmd('startinsert')
    end)
  end
end
au('TermOpen', 'term://*', start_terminal_insert, 'Start builtin terminal in Insert mode')

-- 保存文件时自动清理行末空格和末尾空行
local function clear_whitespace()
  if vim.bo.modifiable then
    vim.cmd('silent! :lua MiniTrailspace.trim()')
    vim.cmd('silent! :lua MiniTrailspace.trim_last_lines()')
  end
end
au('BufWritePre', '*', clear_whitespace, 'Auto remove trailing whitespace on save')

-- 取消indentscope应用在某些特殊buffer
au('FileType', { 'dashboard' }, function ()
  vim.b.miniindentscope_disable = true
end, 'Disable indentscope in special buffers')

-- 为jsonc文件设置注释类型
au('FileType', { 'jsonc' }, function ()
  vim.bo.commentstring = "// %s"
end, 'Add commentstring to jsonc')
