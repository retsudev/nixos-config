{ ... }:
{
  flake.modules.nixos.niri = { pkgs, ... }: {
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };
  };

  flake.modules.homeManager.niri = { niriPackage, ... }: {
    wayland.windowManager.niri = {
      enable = true;
      package = niriPackage;
      # iNiR is wired to niri.service, so install the matching user units.
      systemd.enable = true;
      settings = {
        debug.honor-xdg-activation-with-invalid-serial = { };

        # iNiR's launcher reads this from Niri's app environment. The pinned
        # launcher runs with `set -e` and currently exits if its final
        # optional environment lookup is empty.
        environment.ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };
    };
  };

}
