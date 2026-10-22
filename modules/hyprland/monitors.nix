{ ... }:
{
  flake.modules.homeManager.hyprlandMonitors = { ... }: {
    wayland.windowManager.hyprland.settings.monitor = [ ", preferred, auto, 1.0" ];
  };
}
