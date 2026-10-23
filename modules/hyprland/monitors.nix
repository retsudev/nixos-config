{ ... }:
let
  monitor = {
    output = "";
    mode = "preferred";
    position = "auto";
    scale = 1.0;
  };
in
{
  flake.modules.homeManager.hyprlandMonitors = { ... }: {
    wayland.windowManager.hyprland.settings.monitor = [ { _args = [ monitor ]; } ];
  };
}
