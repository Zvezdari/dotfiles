return {
  "folke/flash.nvim",

  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        enabled = true,
        keys = { "f", "F" },
      },
    },

    label = {
      exclude = ";,",
    },
    treesitter = {
      highlight = {
        backdrop = true,
      }
    }
  },
  keys = {
    { "t", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "T", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  },
}
