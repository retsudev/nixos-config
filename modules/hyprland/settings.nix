{ ... }:
let
  options = {
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
      font_family = "Iosevka Nerd Font";
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };
    animations.enabled = true;
  };

  curves = [
    { name = "smoothWindow"; points = [ [ 0.16 0.77 ] [ 0.33 1.0 ] ]; }
    { name = "smoothIn"; points = [ [ 0.12 0.8 ] [ 0.39 1.0 ] ]; }
    { name = "smoothOut"; points = [ [ 0.4 0.0 ] [ 0.6 1.0 ] ]; }
  ];
  animations = [
    { leaf = "windows"; enabled = true; speed = 5; bezier = "smoothWindow"; style = "slide"; }
    { leaf = "windowsIn"; enabled = true; speed = 5; bezier = "smoothIn"; style = "popin 70%"; }
    { leaf = "windowsOut"; enabled = true; speed = 6; bezier = "smoothOut"; style = "popin 0%"; }
    { leaf = "layers"; enabled = true; speed = 5; bezier = "smoothWindow"; style = "fade"; }
    { leaf = "layersIn"; enabled = true; speed = 5; bezier = "smoothIn"; style = "fade"; }
    { leaf = "layersOut"; enabled = true; speed = 6; bezier = "smoothOut"; style = "fade"; }
    { leaf = "fade"; enabled = true; speed = 5; bezier = "smoothWindow"; }
    { leaf = "workspaces"; enabled = true; speed = 5; bezier = "smoothWindow"; style = "slidevert"; }
    { leaf = "specialWorkspaceIn"; enabled = true; speed = 5; bezier = "smoothIn"; style = "slidefade"; }
    { leaf = "specialWorkspaceOut"; enabled = true; speed = 6; bezier = "smoothOut"; style = "slidefade"; }
  ];
  windowRules = [
    {
      name = "kitty-opacity";
      match.class = "^kitty$";
      opacity = "0.93 override";
    }
    {
      name = "obsidian-window";
      match = {
        class = "^(md\\.Obsidian)$";
        title = ".+ - .+ - Obsidian .+";
      };
      float = true;
      no_shadow = true;
      border_size = 0;
    }
  ];
in
{
  flake.modules.homeManager.hyprlandSettings = { ... }: {
    wayland.windowManager.hyprland.settings = {
      config = options;
      curve = map (curve: {
        _args = [ curve.name { type = "bezier"; points = curve.points; } ];
      }) curves;
      animation = map (animation: { _args = [ animation ]; }) animations;
      window_rule = map (rule: { _args = [ rule ]; }) windowRules;
    };
  };
}
