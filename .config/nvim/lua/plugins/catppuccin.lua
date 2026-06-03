return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000 ,
    lazy = false,
    cond = function()
      return vim.g.theme=="catppuccin"
    end,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        term_colors = true,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
    dependencies = {
      {
        "xiyaowong/transparent.nvim",
        config = function ()
          vim.api.nvim_create_autocmd('UIEnter', {
            pattern = '*',
            callback = function()
              vim.cmd('highlight DropbarMenuNormalFloat blend=0')
              vim.cmd('highlight MiniPickNormal blend=0')
              vim.cmd([[
              highlight clear MiniIndentscopeSymbol
              highlight link MiniIndentscopeSymbol Function
              ]])
            end,
            desc = "Override Highlight group"
          })
          require("transparent").setup({
            extra_groups = {
              "DropbarMenuNormalFloat",
              "DropbarMenuFloatBorder",

              "MiniPickNormal",
              "MiniPickBorder",
              "MiniPickPrompt",
              "MiniPickPromptPrefix",
              "MiniPickPromptCaret",
              "MiniPickBorderText",

              "MiniTablineCurrent",

              "WhichKeyNormal",
              "WhichKeyBorder",
              "WhichKeyTitle",
              "WhichKeyValue",

              "FloatBorder",
              "FloatTitle",
            }
          })
        end,
      }
    }
  },
}
