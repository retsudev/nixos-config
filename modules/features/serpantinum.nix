{inputs, ...}: {
  flake.modules.nixos.serpantinum = {
    imports = [inputs.serpantinum.nixosModules.default];
    programs.serpantinum.enable = true;
  };

  flake.modules.homeManager.serpantinum = {
    config,
    inputs,
    lib,
    pkgs,
    ...
  }: let
    wallpaperDir = "${config.xdg.userDirs.pictures}/Wallpapers";
  in {
    imports = [inputs.serpantinum.homeManagerModules.default];
    programs.serpantinum = {
      enable = true;
      systemd.enable = true;
      settings = {
        inherit wallpaperDir;

        general = {
          language = "en";
          weatherUnit = "metric";
          weatherInterval = 30;
        };

        bar = {
          position = "top";
          style = "solid";
          width = 40;
          workspaceCount = 10;
          modules = {
            left = ["workspaces"];
            center = ["time"];
            right = ["tray" ["kb" "wifi" "bt" "vol" "bat"]];
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

    home.packages = with pkgs; [adwaita-icon-theme nerd-fonts.symbols-only];

    home.activation.ensureSerpantinumWallpapersDirectory = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p "${wallpaperDir}"
    '';
  };
}
