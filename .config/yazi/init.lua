local my_theme = require("yatline-catppuccin"):setup("mocha")

require("full-border"):setup{
  type = ui.Border.ROUNDED,
}
require("smart-enter"):setup {
	open_multi = true,
}
require("yatline"):setup({
  theme = my_theme,
  tab_width = 0,

  style_a = {
    bg = "#b4befe",
    fg = "black",
    bg_mode = {
      normal = "#b4befe",
      select = "yellow",
      un_set = "green",
    }
  },
  style_c = { bg = "#45475a" },

  show_background = false,

  status_line = {
		left = {
			section_a = {
				{ type = "string", name = "tab_mode" },
			},
			section_b = {
				{ type = "string", name = "hovered_size" },
			},
			section_c = {
				{ type = "string", name = "hovered_path", params = { true } },
				{ type = "coloreds", name = "count", params = { true, true } },
        { type = "coloreds", name = "task_states", params = { true } },
			},
		},
		right = {
			section_a = {
				{ type = "string", name = "cursor_position" },
			},
			section_b = {
				{ type = "string", name = "cursor_percentage" },
			},
			section_c = {
				{ type = "string", name = "hovered_file_extension", params = { true } },
				{ type = "coloreds", name = "permissions" },
			},
		},
  },
})
