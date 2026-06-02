local colors = {
  activebg = "#dBa657",
  activefg = "#1d1d1d",
  inactivebg = "#7C6F64",
  inactivefg = "#D4BE98",
}


return {
  {
    'nvim-lualine/lualine.nvim',
    event = { "VeryLazy" },
    config = function()
      require('mini.icons').mock_nvim_web_devicons()
      require('lualine').setup({
        options = {
          disabled_filetypes = { "snacks_dashboard" },
          icons_enabled = true,
          component_separators = '',
        },
        sections = {
          lualine_b = {
            "branch",
            "diff",
            "diagnostics",
            {
              "buffers",
              buffers_color = {
                active = { bg = colors.activebg, fg = colors.activefg, gui = "bold" },
                inactive = { bg = colors.inactivebg, fg = colors.inactivefg, gui = "italic" },
              },
              symbols = {
                modified = " ●",
                alternate_file = "",
                directory = "",
              },
              mode = 0,
            },
          },
          lualine_c = {
          },
          lualine_x = {
            "fileformat",
          },
          lualine_y = {
            "searchcount",
            "selectioncount",
            "filetype",
          },
          lualine_z = {
            "encoding",
            {
              "location",
              padding = 0,
            },
          }
        },
      })
    end
  }
}
