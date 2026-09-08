return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
        emmet_language_server = {
          filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
        },
      },
    },
  },
}
