{ pkgs, ... }:
{
  programs.lazyvim = {
    enable = true;
    plugins = {
      qmlls = ''
        return {
          "neovim/nvim-lspconfig",
          opts = {
            servers = {
              qmlls = {
                cmd = { "qmlls" },
                filetypes = { "qml", "qmljs" },
              },
            },
          },
        }
      '';
      catppuccin = ''
        return {
          "catppuccin/nvim",
          name = "catppuccin",
          priority = 1000,
          opts = {
            flavour = "mocha",
            integrations = {
              treesitter = true,
              cmp = true,
              lualine = true,
            },
          },
        }
      '';
      colorscheme = ''
        return {
          "LazyVim/LazyVim",
          opts = {
            colorscheme = "catppuccin",
          },
        }
      '';
      blink = ''
        return {
          "saghen/blink.cmp",
          opts = {
            keymap = { preset = "super-tab" },
            completion = {
              ghost_text = { enabled = false },
            },
          },
        }
      '';
      dashboard = ''
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
      '';
    };
    extras.lang = {
      nix.enable = true;
      cmake.enable = true;
      clangd = {
        enable = true;
        installDependencies = true;
      };
    };
    extraPackages = with pkgs; [
      nixd
      alejandra
      statix
      deadnix
    ];
  };
}
