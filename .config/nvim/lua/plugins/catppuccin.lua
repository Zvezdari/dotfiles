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
        integrations = {
          dropbar = { enabled = true, color_mode = true, },
          mini = { enabled = true, indentscope_color = "lavender" },
          noice = true,
          nvim_surround = true,
          snacks = { enabled = true, indent_scope_color = "lavender" },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
    colors = {
      activebg = "#b4befe",
      activefg = "#45475a",
      inactivebg = "#7f849c",
      inactivefg = "#11111b",
      -- bloew colors is references
      "#f5e0dc", "#f2cdcd", "#f5c2e7",
      "#cba6f7", "#f38ba8", "#eba0ac",
      "#fab387", "#f9e2af", "#a6e3a1",
      "#94e2d5", "#89dceb", "#74c7ec",
      "#89b4fa", "#b4befe", "#cdd6f4",
      "#bac2de", "#a6adc8", "#9399b2",
      "#7f849c", "#6c7086", "#585b70",
      "#45475a", "#313244", "#1e1e2e",
      "#181825", "#11111b",
    }
  },
  {
    "xiyaowong/transparent.nvim",
    cond = function()
      return vim.g.theme=="catppuccin"
    end,
    config = function ()
      vim.api.nvim_create_autocmd('UIEnter', {
        pattern = '*',
        callback = function()
          vim.cmd('highlight DropbarMenuNormalFloat blend=0')
          vim.cmd('highlight MiniPickNormal blend=0')
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
