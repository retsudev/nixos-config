{ ... }:
{
  flake.modules.homeManager.hyprlandInput = { ... }: {
    wayland.windowManager.hyprland.settings = {
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        accel_profile = "flat";
        touchpad = {
          tap-to-click = true;
          natural_scroll = true;
          disable_while_typing = true;
          accel_profile = "flat";
        };
      };

      gesture = [ "3, vertical, workspace" ];
    };
  };
}
