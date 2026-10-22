{ self, ... }:
{
  flake.modules.nixos.desktop = { config, lib, pkgs, ... }: {
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
            command = "${config.programs.hyprland.package}/bin/Hyprland";
            user = config.desktop.autoLoginUser;
          };

          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${config.programs.hyprland.package}/bin/Hyprland";
            user = "greeter";
          };
        };
      };
    };
  };

}
