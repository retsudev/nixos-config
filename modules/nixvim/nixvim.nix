{ ... }:
{
  flake.modules.nixos.nixvim = { inputs, ... }: {
    imports = [ inputs.nixvim.nixosModules.nixvim ];

    programs.nixvim = {
      enable = true;

      globals.mapleader = " ";

      opts = {
        number = true;
        relativenumber = true;
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
        termguicolors = true;
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>w";
          action = "<cmd>write<cr>";
          options = {
            desc = "Save file";
            silent = true;
          };
        }
        {
          mode = "n";
          key = "<leader>q";
          action = "<cmd>quit<cr>";
          options = {
            desc = "Close window";
            silent = true;
          };
        }
      ];
    };
  };
}
