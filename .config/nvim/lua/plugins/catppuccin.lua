return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000 ,
    lazy = false,
    config = function()
      -- make lualine transparent
      require("catppuccin").setup({
        -- transparent_background = true,
        term_colors = true,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
