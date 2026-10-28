return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = {
            preset = "sidebar",
            preview = false,
            layout = {
              position = "right",
              width = 27,
              min_width = 27,
            },
          },
        },
      },
    },
  },
}
