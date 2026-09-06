return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua-ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
    },
  },
}
