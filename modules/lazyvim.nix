{ pkgs, ... }:
{
  programs.lazyvim = {
    enable = true;
    plugins = {
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
