{...}: let
  input = {
    kb_layout = "us,ru";
    kb_options = "grp:alt_shift_toggle";
    accel_profile = "flat";
    touchpad = {
      natural_scroll = true;
      disable_while_typing = true;
    };
  };
  gesture = {
    fingers = 3;
    direction = "vertical";
    action = "workspace";
  };
in {
  flake.modules.homeManager.hyprlandInput = {...}: {
    wayland.windowManager.hyprland.settings = {
      config = {inherit input;};
      gesture = [{_args = [gesture];}];
    };
  };
}
