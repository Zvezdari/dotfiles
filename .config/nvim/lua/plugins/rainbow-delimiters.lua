return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function ()
    require("rainbow-delimiters.setup").setup({
      highlight = {
        "RainbowDelimiterBlue",
        "RainbowDelimiterViolet",
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterGreen",
        "RainbowDelimiterCyan",
        "RainbowDelimiterOrange",
      }
    })
  end
}
