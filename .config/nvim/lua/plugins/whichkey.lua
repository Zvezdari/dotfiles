return {
  "folke/which-key.nvim",
  config = function ()
    local icons = require('mini.icons')
    require('which-key').setup({
      preset = "helix",
      icons= {
        mappings = true,
        separator = "│",
      },
      win = {
        wo = {
          winblend = 0,
        },
      },
    })

    require('which-key').add({
      -- group
      { '<leader>f', group = "file/find" },
      { '<leader>b', group = "buffer" },
      { '<leader>w', proxy = '<c-w>', group = "window" },
      { '<leader>t', group = "toggle" },
      { '<leader>s', group = "show" },
      { '<leader>d', group = "diagnostics" },

      -- icon
      { '<leader>fr', icon = icons.get('filetype', 'fzf') },
      { '<leader>fo', icon = { icon = icons.get('filetype', 'neo-tree'), color = "orange" } },
      { '<leader>;',  icon = icons.get('filetype', 'neo-tree') },
    })
  end,
}
