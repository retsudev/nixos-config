{ ... }:
{
  flake.modules.homeManager.hyprlandSettings = { ... }: {
    wayland.windowManager.hyprland.settings = {
      general = {
        border_size = 0;
        gaps_in = 6;
        gaps_out = 10;
        float_gaps = 6;
        resize_on_border = true;
        extend_border_grab_area = 50;
      };

      decoration = {
        rounding = 16;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = true;
          size = 8;
          passes = 2;
          brightness = 0.75;
          contrast = 1.0;
          ignore_opacity = true;
          new_optimizations = true;
          noise = 0.0117;
          vibrancy = 0.1;
        };
        shadow.enabled = false;
      };

      misc = {
        focus_on_activate = false;
        font_family = "JetBrains Mono";
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      animations = {
        enabled = true;
        bezier = [
          "smoothWindow, 0.16, 0.77, 0.33, 1.0"
          "smoothIn, 0.12, 0.8, 0.39, 1.0"
          "smoothOut, 0.4, 0.0, 0.6, 1.0"
        ];
        animation = [
          "windows, 1, 5, smoothWindow, slide"
          "windowsIn, 1, 5, smoothIn, popin 70%"
          "windowsOut, 1, 6, smoothOut, popin 0%"
          "layers, 1, 5, smoothWindow, fade"
          "layersIn, 1, 5, smoothIn, fade"
          "layersOut, 1, 6, smoothOut, fade"
          "fade, 1, 5, smoothWindow"
          "workspaces, 1, 5, smoothWindow, slidevert"
          "specialWorkspaceIn, 1, 5, smoothIn, slidefade"
          "specialWorkspaceOut, 1, 6, smoothOut, slidefade"
        ];
      };

      windowrule = [
        "match:class ^kitty$, opacity 0.93 override"
        "match:class ^(md\\.Obsidian)$, match:title .+ - .+ - Obsidian .+, float on, no_shadow on, border_size 0"
      ];
    };
  };
}
