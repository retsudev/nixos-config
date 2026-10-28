{ ... }:
let
  monitor = {
    output = "";
    mode = "preferred";
    position = "auto";
    scale = 1.2;
  };
in
{
  flake.modules.homeManager.hyprlandMonitors = { ... }: {
    wayland.windowManager.hyprland.settings.monitor = [ { _args = [ monitor ]; } ];
  };
}
