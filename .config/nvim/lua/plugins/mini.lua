return {
  'nvim-mini/mini.nvim',
  version = false,

  config = function()
    -- Autopairs
    require('mini.pairs').setup({
      modes = { insert = true, command = true, terminal = false },
    })
    -- add gc textobject
    require('mini.comment').setup({})
    -- split and join arguments
    require('mini.splitjoin').setup({})

    -- trim all trailing whitespace and empty lines
    require('mini.trailspace').setup({})
    vim.g.minitrailspace_disable = true -- disable trailing highlight

    -- require('mini.diff').setup({})
    -- require('mini.git').setup({})
    -- require('mini.sessions').setup({})
    require('mini.extra').setup({})

    -- 提供 icon 图标
    require('mini.icons').setup({
      lsp = {
        text = { glyph = ' ' },
      },
    })
    -- 增加缩进线绘制以及 ai,ii 文本块，[i 和 ]i 快捷键
    require('mini.indentscope').setup({
      draw = {
        animation = function(next_step, total_stpes) return 5 end,  -- 绘制时间设置为 5 ms
      }
    })

    -- Hightlight text with configurable patterns and highlight groups
    -- mainly used for handling color-preview problem in @defrine-color in css file
    require('mini.hipatterns').setup({
      highlighters = {
        todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },

        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
      }
    })

    -- ==============================================
    -- mini.keymap
    -- ==============================================
    require('mini.keymap').setup({})
    local map_combo = require('mini.keymap').map_combo
    local mode = { 'i', 'c', 'x', 's' }
    -- Support most common modes. This can also contain 't', but would
    -- only mean to press `<Esc>` inside terminal.
    map_combo(mode, 'jk', '<BS><BS><Esc>')
    -- Escape into Normal mode from Terminal mode
    map_combo('t', 'jk', '<BS><BS><C-\\><C-n>')

    -- ==============================================
    -- mini.snippets
    -- ==============================================
    local gen_loader = require('mini.snippets').gen_loader
    require('mini.snippets').setup({
      snippets = {
        -- 参考https://github.com/rafamadriz/friendly-snippets/tree/main/snippets
        gen_loader.from_lang(),
      },
      mappings = {
        expand = '',
      }
    })

    -- use [ and ] to navigate
    require('mini.bracketed').setup({
      file = { suffix = '', options = {} },
      indent = { suffix = '', options = {} },
      treesitter = { suffix = '', options = {} },
      location = { suffix = '', options = {} },
      quickfix = { suffix = '', options = {} },
      jump = { suffix = '', options = {} },
      buffer = { suffix = '', options = {} },
      undo = { suffix = '', options = {} },
      -- 保留 comment, conflct, diagnostic, oldfile, yank, window
    })

    require('mini.files').setup({
      mappings = {
        close = 'q',
      },
      windows = {
        preview = true,
      }
    })
  end,
}
