return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
      signature = {
        enabled = false
      }
    },
    presets = {
      long_message_to_split = true,
      lsp_doc_border = true,
      bottom_search = true,
    },
    views = {
      cmdline_popup = {
        position = {
          row = '10%',
          col = '50%',
        },
      },
    },
    cmdline = {
      enabled = true,
      opts = {
        win_options = {
          winblend = 0, -- 确保窗口不透明
        }
      }
    },
    notify = {
      enabled =false, -- disable noice-notify, use snacks.notifier instead
    },
    popupmenu = {
      enabled = false, -- Stop noice rendering auto-completion menu
    },
    routes = {
      -- Show @recording messages via notification
      { view = "notify", filter = { event = "msg_showmode" } },
      -- Hide lines-change notification
      { opts = { skip = true }, filter = { event = 'msg_show', find = 'lines' } },
    }
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
  },
}
