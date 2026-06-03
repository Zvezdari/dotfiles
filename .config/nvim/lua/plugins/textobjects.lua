return {
  'nvim-mini/mini.ai',
  version = false,
  config = function ()
    require('mini.ai').setup({
      custom_textobjects = {
        -- Camel Name textobject
        c = {
          {
            '%u[%l%d]+%f[^%l%d]',
            '%f[%S][%l%d]+%f[^%l%d]',
            '%f[%P][%l%d]+%f[^%l%d]',
            '^[%l%d]+%f[^%l%d]',
          },
          '^().*()$',
        },
        -- Snake Name textobject
        ['_'] = { '()_?%f[%w]%w+%f[^%w]_?()' },
      },
    })
  end
}
