local function make_transparent(group)
  local hl = vim.api.nvim_get_hl(0, {
    name = group,
    link = false,
  })

  hl.bg = "NONE"

  vim.api.nvim_set_hl(0, group, hl)
end

local function apply_transparency()
  -- Основные окна Neovim
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "FoldColumn",
    "EndOfBuffer",

    -- UI
    "StatusLine",
    "StatusLineNC",
    "WinBar",
    "WinBarNC",
    "TabLine",
    "TabLineFill",
    "TabLineSel",

    -- Popup / completion
    "Pmenu",
    "PmenuSel",
    "PmenuSbar",
    "PmenuThumb",

    -- Дополнительные области
    "CursorLine",
    "ColorColumn",

    -- Snacks
    "SnacksNormal",
    "SnacksNormalNC",
    "SnacksWinBar",
    "SnacksWinBarNC",
    "SnacksPicker",
    "SnacksPickerInput",
    "SnacksPickerList",
    "SnacksPickerPreview",
    "SnacksPickerBox",
    "SnacksPickerBorder",
    "SnacksPickerInputBorder",
    "SnacksPickerListBorder",
    "SnacksPickerPreviewBorder",
    "SnacksExplorer",
    "SnacksExplorerNormal",
  }

  for _, group in ipairs(groups) do
    make_transparent(group)
  end

  -- Не даём floating windows дополнительно смешиваться с фоном
  vim.opt.winblend = 0
  vim.opt.pumblend = 0
end

local function schedule_transparency()
  vim.schedule(apply_transparency)
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,

    opts = {
      flavour = "mocha",

      transparent_background = true,

      float = {
        transparent = true,
        solid = false,
      },

      highlight_overrides = {
        mocha = function(colors)
          return {
            Normal = { bg = colors.none },
            NormalNC = { bg = colors.none },
            NormalFloat = { bg = colors.none },
            FloatBorder = { bg = colors.none },
            SignColumn = { bg = colors.none },
            FoldColumn = { bg = colors.none },
            EndOfBuffer = { bg = colors.none },
          }
        end,
      },
    },

    init = function()
      local group = vim.api.nvim_create_augroup(
        "ForceTransparency",
        { clear = true }
      )

      -- После загрузки/перезагрузки colorscheme
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = schedule_transparency,
      })

      -- После появления UI
      vim.api.nvim_create_autocmd("UIEnter", {
        group = group,
        callback = schedule_transparency,
      })

      vim.api.nvim_create_autocmd("VimEnter", {
        group = group,
        callback = schedule_transparency,
      })

      -- После создания/открытия новых окон и буферов
      vim.api.nvim_create_autocmd(
        { "WinNew", "WinEnter", "BufWinEnter" },
        {
          group = group,
          callback = schedule_transparency,
        }
      )

      -- LazyVim / lazy.nvim могут догружать UI после старта
      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = { "LazyDone", "VeryLazy" },
        callback = schedule_transparency,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
}
