local my_theme = {
  -- yatline
    section_separator_open = "",
    section_separator_close = "",

    inverse_separator_open = "",
    inverse_separator_close = "",

    part_separator_open = "",
    part_separator_close = "",

    style_a = {
      fg = "{{colors.surface_container_low.default.hex}}",
      bg_mode = {
        normal = "{{colors.surface_tint.default.hex}}",
        select = "{{colors.tertiary_fixed.default.hex}}",
        un_set = "{{colors.on_error_container.default.hex}}",
      },
    },
    style_b = { bg = "{{colors.surface_container_highest.default.hex}}", fg = "{{colors.on_surface.default.hex}}" },
    style_c = { bg = "{{colors.surface_container_lowest.default.hex}}", fg = "{{colors.on_surface.default.hex}}" },

    permissions_t_fg = "{{colors.secondary.default.hex | auto_lightness: 20.0}}",
    permissions_r_fg = "{{colors.tertiary.default.hex | auto_lightness: 20.0}}",
    permissions_w_fg = "{{colors.error.default.hex | auto_lightness: 20.0}}",
    permissions_x_fg = "{{colors.tertiary_fixed.default.hex | auto_lightness: 20.0}}",
    permissions_s_fg = "{{colors.primary_fixed.default.hex | auto_lightness: 20.0}}",

    selected = { icon = "󰻭", fg = "{{colors.tertiary.default.hex}}" },
    copied = { icon = "", fg = "{{colors.secondary.default.hex}}" },
    cut = { icon = "", fg = "{{colors.on_error_container.default.hex}}" },
    files = { icon = "", fg = "{{colors.primary.default.hex}}" },
    filtereds = { icon = "", fg = "{{colors.tertiary_fixed_dim.default.hex}}" },

    total = { icon = "", fg =  "{{colors.on_secondary_container.default.hex}}"},
    success = { icon = "", fg = "{{colors.error.default.hex}}" },
    failed = { icon = "", fg = "{{colors.error_container.default.hex}}" },

    -- yatline-githead
    branch_color = "{{colors.secondary_container.default.hex}}",
    remote_branch_color = "{{colors.on_primary_fixed_variant.default.hex}}",
    tag_color = "{{colors.tertiary_fixed.default.hex}}",
    commit_color = "{{colors.tertiary_fixed_dim.default.hex}}",
    behind_remote_color = "{{colors.on_primary_container.default.hex}}",
    ahead_remote_color = "{{colors.primary_fixed.default.hex}}",
    stashes_color = "{{colors.on_secondary_fixed_variant.default.hex}}",
    state_color = "{{colors.on_surface_variant.default.hex}}",
    staged_color = "{{colors.tertiary.default.hex}}",
    unstaged_color = "{{colors.secondary_fixed.default.hex}}",
    untracked_color = "{{colors.primary_container.default.hex}}",
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
