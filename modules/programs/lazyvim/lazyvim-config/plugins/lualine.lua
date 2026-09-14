return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_c = {
      opts.sections.lualine_c[1],
      opts.sections.lualine_c[2],
      opts.sections.lualine_c[3],
      opts.sections.lualine_c[4],
    }
  end,
}
