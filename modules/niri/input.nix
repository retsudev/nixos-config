{ ... }:
{
  flake.wrappers.niri = { ... }: {
    settings.input = {
      keyboard.xkb = {
        layout = "us,ru";
        options = "grp:alt_shift_toggle";
      };

      touchpad = {
        tap = _: { };
        natural-scroll = _: { };
        dwt = _: { };
        accel-profile = "flat";
      };
      mouse.accel-profile = "flat";
      focus-follows-mouse = _: {
        props.max-scroll-amount = "0%";
      };
    };
  };
}
