{ ... }:
{
  flake.modules.homeManager.niriInput = {
    wayland.windowManager.niri.settings.input = {
      keyboard.xkb = {
        layout = "us,ru";
        options = "grp:alt_shift_toggle";
      };

      touchpad = {
        tap = { };
        natural-scroll = { };
        dwt = { };
        accel-profile = "flat";
      };
      mouse.accel-profile = "flat";
      focus-follows-mouse = {
        _props.max-scroll-amount = "0%";
      };
    };
  };
}
