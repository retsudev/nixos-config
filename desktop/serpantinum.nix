{
  config,
  pkgs,
  serpantinum,
  ...
}:

{
  imports = [
    serpantinum.homeManagerModules.default
  ];

  programs.serpantinum = {
    enable = true;
    systemd.enable = true;

    settings = {
      wallpaperDir = "/home/retsudev/Pictures/Wallpapers";

      general = {
        language = "en";
        weatherUnit = "metric";
        weatherInterval = 30;
        location = {
          latitude = 45.0355;
          longitude = 38.9753;
          city = "Krasnodar";
          region = "Krasnodar Krai";
          country_name = "Russia";
          country_code = "RU";
          source = "manual";
          updated_at = 1893456000;
        };
      };

      bar = {
        position = "top";
        style = "solid";
        width = 40;
        workspaceCount = 10;
        modules = {
          left = [ "workspaces" ];
          center = [ "time" ];
          right = [
            "tray"
            [
              "kb"
              "wifi"
              "bt"
              "vol"
              "bat"
            ]
          ];
        };
      };

      theme = {
        fontFamily = "Adwaita Mono";
        borderRadius = 12;
        matugen = true;
      };

      notifications = {
        dnd = false;
        position = "top right";
        sound = true;
      };
    };
  };
  home.packages = with pkgs; [
    adwaita-icon-theme
    wl-clipboard
    cliphist
  ];
}
