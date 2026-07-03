local km = vim.keymap

-- -------normal mode---------
km.set('n', '<leader>l', '<Cmd>Lazy<CR>', { desc = "Lazy" })
km.set('n', '<leader>m', '<Cmd>Mason<CR>', { desc = "Mason Lsp" })
km.set('n', ']<Space>', 'o<Esc>', { desc = "Add new line below" })
km.set('n', '[<Space>', 'O<Esc>', { desc = "Add new line above" })
km.set({'n', 'o', 'x'}, "L", "$")
km.set({'n', 'o', 'x'}, "H", "^")
km.set('n', 'j', "v:count ? 'j' : 'gj'", { expr = true }) -- 无数字前缀时，按屏幕行跳转，否则按逻辑行跳转
km.set('n', 'k', "v:count ? 'k' : 'gk'", { expr = true })

-- -------visual mode---------
km.set("x", "m", "<Cmd>m '>+1<CR>gv=gv") -- 将选中块向下移动一行
km.set("x", "n", "<Cmd>m '<-2<CR>gv=gv") -- 将选中块向上移动一行

-- Copy/paste with system clipboard
km.set({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
km.set(  'n',        'gp', '"+p', { desc = 'Paste from system clipboard' })
km.set(  'x',        'gp', '"+P', { desc = 'Paste from system clipboard' })

-- Reselect latest changed, put, or yanked text
km.set('n', 'gV', '"g`[" . strpart(getregtype(), 0, 1) . "g`]"', { expr = true, replace_keycodes = false, desc = 'Visually select changed text' })

-- Search inside visually highlighted text. Use `silent = false` for it to
-- make effect immediately.
km.set('x', 'g/', '<esc>/\\%V', { silent = false, desc = 'Search inside visual selection' })

-- Move only sideways in command mode. Using `silent = false` makes movements
-- to be immediately shown.
km.set('c', '<M-h>', '<Left>',  { silent = false, desc = 'Left' })
km.set('c', '<M-l>', '<Right>', { silent = false, desc = 'Right' })

-- Don't `noremap` in insert mode to have these keybindings behave exactly
-- like arrows (crucial inside TelescopePrompt)
km.set('i', '<M-h>', '<Left>',  { noremap = false, desc = 'Left' })
km.set('i', '<M-j>', '<Down>',  { noremap = false, desc = 'Down' })
km.set('i', '<M-k>', '<Up>',    { noremap = false, desc = 'Up' })
km.set('i', '<M-l>', '<Right>', { noremap = false, desc = 'Right' })

km.set('t', '<M-h>', '<Left>',  { desc = 'Left' })
km.set('t', '<M-j>', '<Down>',  { desc = 'Down' })
km.set('t', '<M-k>', '<Up>',    { desc = 'Up' })
km.set('t', '<M-l>', '<Right>', { desc = 'Right' })

-- Toogle configurations
-- toggle-diagnostic and toggle-inlayHints in lsp.lua
km.set('n', '<leader>tb', '<Cmd>lua vim.o.bg = vim.o.bg == "dark" and "light" or "dark"<CR>', { desc = "Toggle dark and light" })
km.set('n', '<leader>tc', '<Cmd>setlocal cursorcolumn!<CR>', { desc = "Toggle cursorcolumn" })
km.set('n', '<leader>tw', '<Cmd>setlocal wrap!<CR>', { desc = "Toggle wrap" })
km.set('n', '<leader>tl', '<Cmd>setlocal list!<CR>', { desc = "Toggle list" })
km.set('n', '<leader>tt', '<Cmd>setlocal expandtab!<CR>', { desc = "Toggle expandtab" })
km.set('n', '<leader>tn', '<Cmd>let v:hlsearch = 1 - v:hlsearch<CR>', { desc = "Toggle search highlight" })

km.set('n', '<leader>fo', require('mini.files').open,  { desc = "Explorer NeoTree" })
km.set('n', '<leader>fr', '<Cmd>Pick oldfiles<CR>', { desc = "Pick recent files" })
km.set('n', '<leader>ff', '<Cmd>Pick files<CR>', { desc = "Pick files" })
km.set('n', '<leader>fc', '<Cmd>Pick history<CR>', { desc = "Pick command history" })
km.set('n', '<leader>fg', '<Cmd>Pick registers<CR>', { desc = "Pick registers" })
km.set('n', '<leader>fh', require('snacks.notifier').show_history, { desc = "Show notify history" })
km.set('n', '<leader>fd', require('snacks.dashboard').open, { desc = "Show dashboard" })

-- buffer
km.set('n', '<leader>bd', '<Cmd>bd<CR>', { desc = "Close current buffer" })
km.set('n', '<leader>bp', '<Cmd>bprevious<CR>', { desc = "Jump to prev buffer" })
km.set('n', '<leader>bn', '<Cmd>bnext<CR>', { desc = "Jump to next buffer" })
km.set('n', '<leader>bf', '<Cmd>Pick buffers<CR>', { desc = "Pick buffers" })


--------------------------------------------------
-- Custom Kyemappings for Complicated Fucntions
--------------------------------------------------

-- open url
-- km.set('v', 'gx', function ()
--   vim.cmd('normal! "vy')
--   local selected = vim.fn.getreg('v')
--   selected = vim.trim(selected)
--
--   if selected == '' then
--     vim.notify('No text selected', vim.log.levels.WARN)
--     return
--   end
--
--   local patterns = {
--     'https?://[%w%-%.]+%.[%w]+[^%s<>"{}|\\\\^`%[%]]*',  -- http/https
--     'ftp://[%w%-%.]+%.[%w]+[^%s<>"{}|\\\\^`%[%]]*',     -- ftp
--     'file://[^%s<>"{}|\\\\^`%[%]]+',                    -- file
--     'www%.[%w%-%.]+%.[%w]+[^%s<>"{}|\\\\^`%[%]]*',     -- www. 开头
--     '[%w%-%.]+%.[%w]+/[^%s<>"{}|\\\\^`%[%]]*',         -- domain.com/path
--   }
--
--   local url = nil
--   for _, pattern in ipairs(patterns) do
--     local matched = string.match(selected, '^' .. pattern .. '$')
--     if matched then
--       url = matched
--       break
--     end
--     local extracted = string.match(selected, pattern)
--     if extracted then
--       url = extracted
--       break
--     end
--   end
--
--   if not url then
--     if string.match(selected, '[%w%-%.]+/[%w%-%.%_]+') then
--       url = 'https://github.com/' .. selected
--     end
--   end
--
--   if url then
--     -- 如果 URL 没有协议，补上 https://
--     if not string.match(url, '^https?://') and not string.match(url, '^ftp://') and not string.match(url, '^file://') then
--       url = 'https://' .. url
--     end
--     vim.ui.open(url)
--   else
--     vim.notify('Selected text is not a valid URL: ' .. selected, vim.log.levels.WARN)
--   end
-- end, { desc = 'Open selected URL' })
