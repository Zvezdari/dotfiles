local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- 持久化存储撤销历史，使得关闭文件再打开也可以撤销之前的更改
-- 建议定时清理（虽然体积也不大）
opt.undofile = true

-- 禁用备份文件
opt.backup = false
opt.writebackup = false

opt.tabstop = 2  -- tab宽度
opt.shiftwidth = 2 -- 自动缩进的空格数
opt.expandtab = true -- 将tab转换为空格
opt.autoindent = true -- 开启自动缩进
opt.smartindent = true -- 开启智能缩进

opt.wrap = false -- 开启长文本自动换行
opt.linebreak = true -- 避免在单词内部自动换行
opt.breakindent = true -- 自动换行的新行开头与原行对齐

opt.cursorline = true
opt.mouse:append("a") -- 启用鼠标

opt.splitright = true -- 设置分割窗口出现在右边
opt.splitbelow = true -- 设置分割窗口出现在下边

opt.ignorecase = true -- 搜索忽略大小写
opt.smartcase = true  -- 搜索智能匹配
opt.incsearch = true  -- 输入时实时高亮匹配
opt.infercase = true  -- 智能补全大小写

-- opt.clipboard = 'unnamedplus' -- 所有操作都使用系统剪贴板

opt.winborder = 'single' -- 浮动窗口border样式
opt.winblend = 10 -- 浮动窗口半透明
opt.pumblend = 10 -- 补全菜单半透明
opt.pumheight = 10 -- 补全菜单最大高度

-- 底部状态栏
-- opt.termguicolors = true -- 启用彩色（默认已启用）
opt.signcolumn = "yes"  -- 始终显示行号左侧的符号列
opt.ruler = false -- 底部不显示行列信息
opt.showmode = false  -- 底部不显示当前模式
opt.fillchars = 'eob: ' -- 隐藏文件末尾的~

opt.shortmess:append('WcC') -- 隐藏写入确认，命令行完成信息等
opt.splitkeep = 'screen'  -- 分割窗口时保持屏幕位置


-- 根据文件类型加载对应的缩进规则和插件
vim.cmd('filetype plugin indent on')
