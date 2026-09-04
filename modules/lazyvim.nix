{ pkgs, ... }:
{
  programs.lazyvim = {
    enable = true;
    plugins = {
      colorscheme = ''
        return {
          "slugbyte/lackluster.nvim",
          lazy = false,
          priority = 1000,
          init = function()
            local lackluster = require("lackluster")
            lackluster.setup({
              tweak_background = {
                normal = "none",   -- transparent editor background
                telescope = "none",
                menu = "none",
              },
            })
            vim.cmd.colorscheme("lackluster-hack") -- or "lackluster" / "lackluster-mint"
          end,
        }
      '';
      colorscheme_select = ''
        return {
          "LazyVim/LazyVim",
          opts = {
            colorscheme = "lackluster-hack",  -- or "lackluster" / "lackluster-mint"
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
