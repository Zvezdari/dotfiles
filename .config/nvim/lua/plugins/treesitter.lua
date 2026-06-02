return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  opts = {
    ensure_installed = {
      'c',
      'lua',
      'bash',
      'json'
    },
    sync_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function (_, buf)
        local max_filesize = 100 * 1024
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end
    },
  }
}
