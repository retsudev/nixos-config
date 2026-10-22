{ ... }:
{
  flake.modules.nixos.niri = { pkgs, ... }: {
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };
  };

  flake.modules.homeManager.niri = { pkgs, ... }: {
    wayland.windowManager.niri = {
      enable = true;
      package = pkgs.niri;
      systemd.enable = true;
      settings = {
        debug.honor-xdg-activation-with-invalid-serial = { };
      };
    };
  };

}
