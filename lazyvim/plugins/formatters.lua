return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        java = { "google_java_format" },
        python = { "ruff_format" },
        rust = { "rustfmt" },
        nix = { "alejandra" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      dap = false,
      dap_main = false,
      test = false,
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return tool ~= "java-debug-adapter" and tool ~= "java-test"
      end, opts.ensure_installed or {})
    end,
  },
  {
    "mfussenegger/nvim-dap",
    enabled = false,
  },
  {
    "mfussenegger/nvim-dap-python",
    enabled = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    enabled = false,
  },
}
