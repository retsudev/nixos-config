return {
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,

    init = function()
      local lackluster = require("lackluster")

      lackluster.setup({
        tweak_background = {
          normal = "none",
          telescope = "none",
          menu = "none",
        },
      })

      vim.cmd.colorscheme("lackluster-hack")

      vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
    end,
  },

  {
    "akinsho/bufferline.nvim",

    opts = {
      options = {
        show_buffer_icons = false,

        show_buffer_close_icons = false,
        show_close_icon = false,

        show_tab_indicators = false,

        separator_style = { "", "" },
      },

      highlights = {
        fill = {
          bg = "none",
        },

        background = {
          bg = "none",
        },

        buffer_visible = {
          bg = "none",
        },

        tab = {
          bg = "none",
        },

        tab_close = {
          bg = "none",
        },

        close_button = {
          bg = "none",
        },

        close_button_visible = {
          bg = "none",
        },

        separator = {
          bg = "none",
        },

        separator_visible = {
          bg = "none",
        },

        modified = {
          bg = "none",
        },

        modified_visible = {
          bg = "none",
        },

        duplicate = {
          bg = "none",
        },

        duplicate_visible = {
          bg = "none",
        },
      },
    },
  },
}
