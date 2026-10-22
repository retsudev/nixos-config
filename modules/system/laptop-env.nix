{ self, ... }:
{
  flake.modules.nixos.desktop = { config, lib, pkgs, ... }: {
    imports = [
      self.modules.nixos.niri
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
            command = "${config.programs.niri.package}/bin/niri-session";
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

}
