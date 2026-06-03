return {
  "sainnhe/gruvbox-material",
  lazy = false,
  name = "gruvbox-material",
  cond = vim.g.theme == "gruvbox-material",
  config = function ()
    vim.o.termguicolors = true
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
    vim.cmd.colorscheme("gruvbox-material")
  end
}
