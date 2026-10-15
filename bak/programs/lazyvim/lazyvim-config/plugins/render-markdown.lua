return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    opts = {
      preset = "obsidian",
    },
    keys = {
      {
        "<leader>mr",
        "<cmd>RenderMarkdown toggle<cr>",
        ft = "markdown",
        desc = "Toggle Markdown Render",
      },
    },
  },
}
