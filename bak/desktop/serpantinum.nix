{
  config,
  pkgs,
  serpantinum,
  ...
}:

let
  system = pkgs.stdenv.hostPlatform.system;

  serpantinum-patched =
    serpantinum.packages.${system}.default.overrideAttrs (old: {
      postPatch = ''
        substituteInPlace src/quickshell/widgets/faces/usage/RamFace.qml \
          --replace-fail 'icon: "\uF538"' \
            'icon: String.fromCodePoint(0xF035C)'
      '';
    });
in
{
  imports = [
    serpantinum.homeManagerModules.default
  ];

  programs.serpantinum = {
    enable = true;
    package = serpantinum-patched;
    systemd.enable = true;

    settings = {
      wallpaperDir = "/home/retsudev/Pictures/Wallpapers";

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
    cliphist
    nerd-fonts.symbols-only
  ];
}
