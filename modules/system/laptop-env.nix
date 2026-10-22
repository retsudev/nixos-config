{ self, ... }:
{
  flake.modules.nixos.desktop = { config, lib, pkgs, ... }: {
    imports = [
      self.modules.nixos.niri
      self.modules.nixos.noctalia
      self.modules.nixos.kitty
      self.modules.nixos.fish
      self.modules.nixos.starship
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
            command = "${pkgs.niri}/bin/niri-session";
            user = config.desktop.autoLoginUser;
          };

          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${config.programs.niri.package}/bin/niri-session";
            user = "greeter";
          };
        };
      };
    };
  };

  perSystem = { pkgs, self', ... }: {
    packages.desktop = pkgs.writeShellApplication {
      name = "desktop";

      runtimeInputs = [
        self'.packages.niri
        self'.packages.zen-browser
        pkgs.niri
      ];

      text = ''
        exec ${pkgs.niri}/bin/niri-session "$@"
      '';
    };
  };
}
