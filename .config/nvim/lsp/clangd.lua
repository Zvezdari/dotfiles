return {
  cmd = { 'clangd' }, 
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac', -- AutoTools
    '.git',
  },
  -- 告诉服务器那些事情客户端可以完成
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true, -- 自动补全后，将光标移动到合适的位置，比如移动到补全的方法的括号内部
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' }, -- 处理客户端和服务端之间的编码冲突
  },
}
