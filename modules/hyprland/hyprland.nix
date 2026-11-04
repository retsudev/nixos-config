{self, ...}: {
  # This file is the single Home Manager entry point for the Hyprland feature.
  flake.modules.homeManager.hyprland = {
    imports = [
      self.modules.homeManager.hyprlandBase
      self.modules.homeManager.hyprlandDecorations
      self.modules.homeManager.hyprlandInput
      self.modules.homeManager.hyprlandMonitors
      self.modules.homeManager.hyprlandBootstrap
      self.modules.homeManager.hyprlandHotkeys
      self.modules.homeManager.hyprlandLayouts
    ];
  };

  flake.modules.homeManager.hyprlandBase = {...}: {
    wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";
      # Start graphical-session.target so user services tied to the session run.
      systemd.enable = true;
    };
  };
}
