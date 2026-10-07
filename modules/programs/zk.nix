{ config, ... }:

let
  notesDir = "${config.home.homeDirectory}/notes";
  templatesDir = "${notesDir}/.templates";
in
{
  programs.zk = {
    enable = true;

    exportNotebookDir = true;

    settings = {
      notebook.dir = notesDir;

      note = {
        language = "en";
        extension = "md";

        template = "${templatesDir}/programming.md";
        filename = "{{slug title}}";
      };

      format.markdown = {
        link-format = "wiki";
        hashtags = true;
      };

      tool = {
        editor = "nvim";
      };

      group = {
        daily = {
          paths = [ "daily" ];

          note = {
            filename = "{{format-date now '%d.%m.%Y'}}";
            template = "${templatesDir}/daily.md";
          };
        };

        ideas = {
          paths = [ "ideas" ];

          note = {
            filename = "{{format-date now '%Y-%m-%d_%H-%M'}}-{{slug title}}";
            template = "${templatesDir}/idea.md";
          };
        };

        programming = {
          paths = [ "programming" ];

          note = {
            template = "${templatesDir}/programming.md";
          };
        };

        university = {
          paths = [ "university" ];

          note = {
            template = "${templatesDir}/university.md";
          };
        };
      };

      alias = {
        daily = ''zk new --no-input "$ZK_NOTEBOOK_DIR/daily"'';

        idea = ''zk new "$ZK_NOTEBOOK_DIR/ideas" "$@"'';
        prog = ''zk new "$ZK_NOTEBOOK_DIR/programming" "$@"'';
        uni = ''zk new "$ZK_NOTEBOOK_DIR/university" "$@"'';

        find = "zk edit --interactive";
        last = "zk edit --limit 1 --sort modified-";
      };
    };
  };
}
