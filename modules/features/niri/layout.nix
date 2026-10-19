{ ... }:
{
  flake.wrappers.niri = { ... }: {
    settings.layout = {
      gaps = 6;

      struts = {
        left = 4;
        right = 4;
        top = 4;
        bottom = 4;
      };

      focus-ring.off = _: { };
      border.off = _: { };
      shadow.off = _: { };
    };
  };
}
