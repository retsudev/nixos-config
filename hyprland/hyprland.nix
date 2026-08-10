{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    extraLuaFiles = {
      "00-bootstrap" = ./00-bootstrap.lua;
      "10-monitors" = ./10-monitors.lua;
      "20-layouts" = ./20-layouts.lua;
      "30-keybindings" = ./30-keybindings.lua;
      "40-input" = ./40-input.lua;
      "50-windowrules" = ./50-windowrules.lua;
      "60-decorations" = ./60-decorations.lua;
    };
  };
  home.file.".config/hypr/matugen-colors.lua".text = ''
    return "rgba(cba6f7ff)" -- Catppuccin Mocha · Mauve
  '';
}
