{...}: {
  flake.modules.homeManager.workflow-tools = {
    config,
    pkgs,
    ...
  }: {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "retsudev";
          email = "gamershpw@gmail.com";
        };
        init.defaultBranch = "main";
        credential.helper = "store";
      };
    };

    programs.lazygit = {
      enable = true;
      settings.os.editPreset = "nvim";
    };

    programs.yazi = {
      enable = true;
      enableFishIntegration = true;
      plugins.wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
      keymap.mgr.prepend_keymap = [
        {
          on = "<C-y>";
          run = "plugin wl-clipboard";
          desc = "Copy selected files to system clipboard";
        }
      ];
      settings.mgr = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
      };
    };

    programs.zk = {
      enable = true;
      exportNotebookDir = true;
      settings = {
        notebook.dir = "${config.home.homeDirectory}/notes";
        note = {
          language = "en";
          extension = "md";
          filename = "{{slug title}}";
        };
        format.markdown = {
          link-format = "wiki";
          hashtags = true;
        };
        tool = {
          editor = "nvim";
          shell = "${pkgs.fish}/bin/fish";
        };
        group = {
          daily = {
            paths = ["daily"];
            note = {
              filename = "{{format-date now '%d.%m.%Y'}}";
            };
          };
          ideas = {
            paths = ["ideas"];
            note = {
              filename = "{{format-date now '%Y-%m-%d_%H-%M'}}-{{slug title}}";
            };
          };
          programming = {
            paths = ["programming"];
          };
          university = {
            paths = ["university"];
          };
        };
      };
    };
  };
}
