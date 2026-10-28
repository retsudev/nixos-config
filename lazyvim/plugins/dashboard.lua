return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
██████╗  ██╗   ██╗██╗███╗   ███╗
██╔══██╗ ██║   ██║██║████╗ ████║
██████╔╝ ██║   ██║██║██╔████╔██║
██╔══██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██║  ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          function()
            local stats = require("lazy").stats()
            local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
            return {
              align = "center",
              text = {
                { "⚡ RetsuVim loaded ", hl = "footer" },
                { stats.loaded .. "/" .. stats.count, hl = "special" },
                { " plugins in ", hl = "footer" },
                { ms .. "ms", hl = "special" },
              },
            }
          end,
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        disabled_filetypes = {
          statusline = { "snacks_dashboard" },
        },
      },
    },
  },
}
