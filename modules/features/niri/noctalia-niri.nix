{ ... }:
{
  flake.wrappers.niri.settings = {
    spawn-at-startup = [
      "noctalia"
    ];

    binds = {
      "Mod+Space".spawn-sh = "noctalia msg panel-toggle launcher";
      "Mod+Shift+Space".spawn-sh = "noctalia msg panel-toggle control-center";
      "Mod+Comma".spawn-sh = "noctalia msg settings-toggle";
    };

    debug.honor-xdg-activation-with-invalid-serial = _: { };

    window-rules = [
      {
        matches = [
          { app-id = "dev.noctalia.Noctalia"; }
        ];

        open-floating = true;
        default-column-width.fixed = 1080;
        default-window-height.fixed = 920;
      }
    ];
  };
}
