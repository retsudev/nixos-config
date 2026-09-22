return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
      highlight_overrides = {
        mocha = function()
          return {
            Normal = { bg = "NONE" },
            NormalNC = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            FloatBorder = { bg = "NONE" },
            SignColumn = { bg = "NONE" },
            FoldColumn = { bg = "NONE" },
            EndOfBuffer = { bg = "NONE" },
            SnacksNormal = { bg = "NONE" },
            SnacksNormalNC = { bg = "NONE" },
            SnacksWinBar = { bg = "NONE" },
            SnacksWinBarNC = { bg = "NONE" },
            SnacksPickerInput = { bg = "NONE" },
            SnacksPickerList = { bg = "NONE" },
            SnacksPickerPreview = { bg = "NONE" },
            SnacksPickerBox = { bg = "NONE" },
            SnacksPickerBorder = { bg = "NONE" },
            SnacksExplorer = { bg = "NONE" },
            SnacksExplorerNormal = { bg = "NONE" },
          }
        end,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
}
