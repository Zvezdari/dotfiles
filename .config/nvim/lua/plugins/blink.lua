local function get_mini_icon(ctx)
  if ctx.source_name == "Path" then
    local is_unknown_type = vim.tbl_contains(
        { "link", "socket", "fifo", "char", "block", "unknown" },
        ctx.item.data.type
    )
    local mini_icon, mini_hl, _ = require("mini.icons").get(
        is_unknown_type and "os" or ctx.item.data.type,
        is_unknown_type and "" or ctx.label
    )
    if mini_icon then
        return mini_icon, mini_hl
    end
  end
  local mini_icon, mini_hl, _ = require("mini.icons").get("lsp", ctx.kind)
  return mini_icon, mini_hl
end

return {
  'saghen/blink.cmp',

  -- load when open file or create new file
  event = { 'BufReadPost', 'BufNewFile' },

  -- use a release tag to download pre-built binaries
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'super-tab',
      ['<Tab>'] = { 'select_and_accept', 'fallback' },
      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
    },

    snippets = { preset = 'mini_snippets' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- display function signature when typing function
    signature = {
      enabled = true,
    },

    -- auto_show completion menu in cmdline
    -- cmdline = {completion = { menu = { auto_show = true, } } },

    completion = {
      -- Always show the documentation popup
      documentation = {
        auto_show = true
      },
      ghost_text = { enabled = true },
      -- fuzzy match on the text before and after the cursor
      keyword = { range = 'full' },
      -- Highlight the completion mennu
      list = { selection = { preselect = true, auto_insert = false } },
      menu = {
        draw = {
          columns = { { 'kind_icon' }, { 'label', gap = 1 } },
          components = {
            kind_icon = {
              text = function (ctx)
                local kind_icon, kind_hl = get_mini_icon(ctx)
                return kind_icon
              end,
              highlight = function (ctx)
                local _, hl = get_mini_icon(ctx)
                return hl
              end,
            },
            kind = {
              highlight = function (ctx)
                local _, hl = get_mini_icon(ctx)
                return hl
              end,
            }
          },
        },
      },
    },


    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      -- path completion from cwd instead of current buffer's dir
      providers = {
        path = {
          opts = {
            get_cwd = function (_)
              return vim.fn.getcwd()
            end,
          },
        },
        snippets = {
          score_offset = 1000
        },
      },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      -- providers = {
      --   lsp = {
      --     name = 'LSP',
      --     module = 'blink.cmp.sources.lsp',
      --     transform_items = function (_, items)
      --       return vim.tbl_filter(function (item)
      --         return item.kind ~= require('blink.cmp.types').CompletionItemKind.Keyword
      --       end, items)
      --     end,
      --   },
      -- },
    },
  },
  opts_extend = { "sources.default" }
}
