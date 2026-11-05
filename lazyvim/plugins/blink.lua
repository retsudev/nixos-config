return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        border = "none",
        winblend = 0,
      },
      documentation = {
        window = {
          border = "none",
          winblend = 0,
        },
      },
    },
    keymap = {
      ["<CR>"] = { "fallback" },
      ["<Tab>"] = { "select_and_accept", "fallback" },
    },
  },
  signature = {
    window = {
      border = "none",
      winblend = 0,
    },
  },
}
