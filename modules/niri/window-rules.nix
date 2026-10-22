{ ... }:
{
  flake.modules.homeManager.niriWindowRules = {
    wayland.windowManager.niri.settings.window-rule._children = [
      {
        geometry-corner-radius = 8;
        clip-to-geometry = true;
      }
    ];
  };
}
