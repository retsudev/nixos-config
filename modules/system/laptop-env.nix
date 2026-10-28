{self, ...}: {
  flake.modules.nixos.desktop = {
    config,
    lib,
    pkgs,
    ...
  }: let
    hyprlandSession = "${pkgs.hyprland}/bin/start-hyprland";
  in {
    imports = [
      self.modules.nixos.hyprland
      self.modules.nixos.serpantinum
    ];

    options.desktop.autoLoginUser = lib.mkOption {
      type = lib.types.str;
      description = "User for the automatic desktop session.";
    };

    config = {
      services.greetd = {
        enable = true;

        settings = {
          initial_session = {
            command = hyprlandSession;
            user = config.desktop.autoLoginUser;
          };

          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd '${hyprlandSession}'";
            user = "greeter";
          };
        };
      };
    };
  };
}
