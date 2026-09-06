return {
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
}
