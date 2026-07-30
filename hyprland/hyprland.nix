{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    extraLuaFiles = {
      "00-bootstrap"   = ./00-bootstrap.lua;
      "10-monitors"    = ./10-monitors.lua;
      "20-layouts"     = ./20-layouts.lua;
      "30-keybindings" = ./30-keybindings;
    };
  };
}
