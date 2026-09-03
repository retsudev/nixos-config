{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    extraLuaFiles = {
      "autostart" = ./autostart.lua;
      "env" = ./env.lua;
      "keybinds" = ./keybinds.lua;
      "monitors" = ./monitors.lua;
      "settings" = ./settings.lua;
      "variables" = ./variables.lua;
    };
  };
}
