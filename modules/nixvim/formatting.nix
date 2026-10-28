{ ... }:
{
  flake.modules.nixos.nixvimFormatting = { ... }: {
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = false;

      statuscolumn = "%s%3l  │";
    };

    plugins.lualine = {
      enable = true;
      settings = {
        options = {
          theme = "auto";
          component_separators = "";
          section_separators = "";
          globalstatus = true;
        };

        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "filename" "filetype" ];
          lualine_c = [ ];
          lualine_x = [ "branch" "diff" ];
          lualine_y = [ "location" ];
          lualine_z = [ "os.date('%H:%M')" ];
        };

        inactive_sections = {
          lualine_a = [ ];
          lualine_b = [ "filename" ];
          lualine_c = [ ];
          lualine_x = [ ];
          lualine_y = [ ];
          lualine_z = [ "location" ];
        };
      };
    };
  };
  };
}
