local my_theme = {
  -- yatline
    section_separator_open = "",
    section_separator_close = "",

    inverse_separator_open = "",
    inverse_separator_close = "",

    part_separator_open = "",
    part_separator_close = "",

    style_a = {
      fg = "#161c24",
      bg_mode = {
        normal = "#a5c8ff",
        select = "#e3dfff",
        un_set = "#ffdad6",
      },
    },
    style_b = { bg = "#30353e", fg = "#dee2ef" },
    style_c = { bg = "#090e17", fg = "#dee2ef" },

    permissions_t_fg = "#6f80d3",
    permissions_r_fg = "#6e64f0",
    permissions_w_fg = "#ff5945",
    permissions_x_fg = "#8a79ff",
    permissions_s_fg = "#6ea1ff",

    selected = { icon = "󰻭", fg = "#c5c1f9" },
    copied = { icon = "", fg = "#bdc5eb" },
    cut = { icon = "", fg = "#ffdad6" },
    files = { icon = "", fg = "#a5c8ff" },
    filtereds = { icon = "", fg = "#c5c1f9" },

    total = { icon = "", fg =  "#dce1ff"},
    success = { icon = "", fg = "#ffb4ab" },
    failed = { icon = "", fg = "#93000a" },

    -- yatline-githead
    branch_color = "#3d4565",
    remote_branch_color = "#004785",
    tag_color = "#e3dfff",
    commit_color = "#c5c1f9",
    behind_remote_color = "#d4e3ff",
    ahead_remote_color = "#d4e3ff",
    stashes_color = "#3d4565",
    state_color = "#c2c6d2",
    staged_color = "#c5c1f9",
    unstaged_color = "#dce1ff",
    untracked_color = "#004785",
}

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
      section_a = {},
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
