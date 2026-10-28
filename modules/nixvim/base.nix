{ ... }:
{
  flake.modules.nixos.nixvimBase = { ... }: {
  programs.nixvim = {
    globals.mapleader = " ";

    opts = {
      # Use two spaces for indentation and insert spaces when Tab is pressed.
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      autoindent = true;

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
