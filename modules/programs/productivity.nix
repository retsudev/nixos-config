{ ... }:
{
  flake.modules.homeManager.productivity = { config, pkgs, ... }: {
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
      theme = {
        mode = {
          normal_main = { fg = "black"; bg = "white"; bold = true; };
          normal_alt = { fg = "white"; bg = "black"; };
          select_main = { fg = "black"; bg = "white"; bold = true; };
          select_alt = { fg = "white"; bg = "black"; };
          unset_main = { fg = "black"; bg = "white"; bold = true; };
          unset_alt = { fg = "white"; bg = "black"; };
        };
        status = {
          perm_sep.fg = "reset";
          perm_type.fg = "reset";
          perm_read.fg = "reset";
          perm_write.fg = "reset";
          perm_exec.fg = "reset";
        };
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
          template = "${config.home.homeDirectory}/notes/.templates/programming.md";
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
            paths = [ "daily" ];
            note = {
              filename = "{{format-date now '%d.%m.%Y'}}";
              template = "${config.home.homeDirectory}/notes/.templates/daily.md";
            };
          };
          ideas = {
            paths = [ "ideas" ];
            note = {
              filename = "{{format-date now '%Y-%m-%d_%H-%M'}}-{{slug title}}";
              template = "${config.home.homeDirectory}/notes/.templates/idea.md";
            };
          };
          programming = {
            paths = [ "programming" ];
            note.template = "${config.home.homeDirectory}/notes/.templates/programming.md";
          };
          university = {
            paths = [ "university" ];
            note.template = "${config.home.homeDirectory}/notes/.templates/university.md";
          };
        };
        alias = {
          daily = ''zk new --no-input "$ZK_NOTEBOOK_DIR/daily"'';
          find = "zk edit --interactive";
          last = "zk edit --limit 1 --sort modified-";
        };
      };
    };

  };
}
