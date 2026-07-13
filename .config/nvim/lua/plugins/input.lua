return {
  'nvim-mini/mini.input',
  version = false,
  config = function ()
    local adjust_config = function (_, config)
      config.border = 'rounded'
      return config
    end

    local floatwin = require('mini.input').gen_view.floatwin
    local view_tm = floatwin({ style = 'TM', adjust_config = adjust_config })
    local view_bl = floatwin({ style = 'BL', adjust_config = adjust_config })
    local view_handler = function (state)
      local scope, view = state.opts.scope, view_tm
      if scope == 'cursor' or scope == 'line' then
        view = view_bl
      end
      return view(state)
    end

    require('mini.input').setup({
      handlers = {
        view = view_handler
      }
    })
  end
}
