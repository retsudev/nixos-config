return {
  "folke/snacks.nvim",
  opts = function (_, opts)
    opts.dashboard.preset.header = [[
██████╗ ███████╗████████╗███████╗██╗   ██╗  ██╗   ██╗██╗███╗   ███╗
██╔══██╗██╔════╝╚══██╔══╝██╔════╝██║   ██║  ██║   ██║██║████╗ ████║
██████╔╝█████╗     ██║   ███████╗██║   ██║  ██║   ██║██║██╔████╔██║
██╔══██╗██╔══╝     ██║   ╚════██║██║   ██║  ╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██║███████╗   ██║   ███████║╚██████╔╝   ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝ ╚═════╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]
    opts.dashboard.preset.keys = vim.tbl_filter(function(key)
      return not vim.tbl_contains({ "Config", "Lazy", "Lazy Extras", "Projects" }, key.desc)
    end, opts.dashboard.preset.keys)
  end,
}
