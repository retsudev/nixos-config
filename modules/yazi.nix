{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    extraPackages = [ pkgs.wl-clipboard ];

    plugins = {
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          on = "<C-y>";
          run = "plugin wl-clipboard";
          desc = "Copy selected files to system clipboard";
        }
      ];
    };

    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
      };
    };
    theme = {
      mode = {
        normal_main = { fg = "black"; bg = "white"; bold = true; };
        normal_alt  = { fg = "white"; bg = "black"; };
        select_main = { fg = "black"; bg = "white"; bold = true; };
        select_alt  = { fg = "white"; bg = "black"; };
        unset_main  = { fg = "black"; bg = "white"; bold = true; };
        unset_alt   = { fg = "white"; bg = "black"; };
      };
      status = {
        perm_sep   = { fg = "reset"; };
        perm_type  = { fg = "reset"; };
        perm_read  = { fg = "reset"; };
        perm_write = { fg = "reset"; };
        perm_exec  = { fg = "reset"; };
      };
    };
  };
}
