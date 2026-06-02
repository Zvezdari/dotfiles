return {
  "xiyaowong/transparent.nvim",
  config = function ()
    require("transparent").setup({
      extra_groups = {
        "DropbarMenuNormalFloat",
        "DropbarMenuFloatBorder",

        "MiniPickNormal",
        "MiniPickBorder",
        "MiniPickPrompt",
        "MiniPickPromptPrefix",
        "MiniPickPromptCaret",
        "MiniPickBorderText",

        "MiniTablineCurrent",

        "WhichKeyNormal",
        "WhichKeyBorder",
        "WhichKeyTitle",
        "WhichKeyValue",

        "FloatBorder",
        "FloatTitle",
      }
    })
  end,
}
