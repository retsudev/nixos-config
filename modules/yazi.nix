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
  };
}
