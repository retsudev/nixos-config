{ ... }:
{
  flake.wrappers.niri = { ... }: {
    settings.window-rules = [
      {
        matches = [
          { app-id = "^kitty$"; }
        ];
        opacity = 0.93;
        background-effect = {
          blur = true;
        };
      
        geometry-corner-radius = 16;
        clip-to-geometry = true;
      }
    ];
  };
}
