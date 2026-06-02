return {
  'nvim-mini/mini.nvim',
  version = false,

  config = function()
    require('mini.pairs').setup({})
    require('mini.comment').setup({})
    require('mini.keymap').setup({})
    require('mini.splitjoin').setup({})
    require('mini.trailspace').setup({})
    vim.g.minitrailspace_disable = true
    -- require('mini.diff').setup({})
    -- require('mini.git').setup({})
    -- require('mini.sessions').setup({})

    require('mini.icons').setup({})
    require('mini.indentscope').setup({})

    -- ==============================================
    -- mini.keymap
    -- ==============================================
    local map_multistep = require('mini.keymap').map_multistep
    local map_combo = require('mini.keymap').map_combo
    local mode = { 'i', 'c', 'x', 's' }

    map_multistep('i', '<Tab>',   { 'pmenu_next' })
    map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
    map_multistep('i', '<CR>',    { 'pmenu_accept', 'minipairs_cr' })
    map_multistep('i', '<BS>',    { 'minipairs_bs' })

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

    -- ==============================================
    -- mini.bracketed
    -- ==============================================
    require('mini.bracketed').setup({
      file = { suffix = '', options = {} },
      indent = { suffix = '', options = {} },
      treesitter = { suffix = '', options = {} },
      location = { suffix = '', options = {} },
      quickfix = { suffix = '', options = {} },
      window = { suffix = '', options = {} },
      jump = { suffix = '', options = {} },
      -- 保留buffer, comment, conflct, diagnostic, oldfile, undo, yank
    })

    -- ==============================================
    -- mini.files
    -- ==============================================
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
