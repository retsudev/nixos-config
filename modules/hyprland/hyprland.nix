{ ... }:
{
  flake.modules.homeManager.hyprland = { pkgs, ... }: {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
    };
  };
}
