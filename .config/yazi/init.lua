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
  show_background = false,

  header_line = {
    left = {
      section_a = {
      },
      section_b = {},
      section_c = {}
    },
    right = {
      section_a = {
        { type = "line", name = "tabs" },
      },
      section_b = {},
      section_c = {}
    }
  },

  status_line = {
		left = {
			section_a = {
				{ type = "string", name = "tab_mode" },
			},
			section_b = {
				{ type = "string", name = "hovered_size" },
			},
			section_c = {
				{ type = "coloreds", name = "count", params = { true, true } },
        { type = "coloreds", name = "task_states", params = { true } },
			},
		},
		right = {
			section_a = {
				{ type = "string", name = "cursor_position" },
			},
			section_b = {
				{ type = "string", name = "hovered_file_extension", params = { true } },
			},
			section_c = {
				{ type = "coloreds", name = "permissions" },
			},
		},
  },
})
require("starship"):setup()
