{ ... }:
{
  flake.wrappers.niri = { ... }: {
    settings.window-rules = [
      {
        geometry-corner-radius = 8;
        clip-to-geometry = true;
      }
    ];
  };
}
