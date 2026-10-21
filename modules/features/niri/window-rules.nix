{ ... }:
{
  flake.wrappers.niri = { ... }: {
    settings.window-rules = [
      {
        matches = [
          { app-id = "^kitty$"; }
        ];
        geometry-corner-radius = 16;
        clip-to-geometry = true;
      }
    ];
  };
}
