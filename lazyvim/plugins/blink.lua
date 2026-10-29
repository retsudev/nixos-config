return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        border = "rounded",
        winblend = 100,
      },
    },
    keymap = {
      ["<CR>"] = { "fallback" },
      ["<Tab>"] = { "select_and_accept", "fallback" },
    },
  },
}
