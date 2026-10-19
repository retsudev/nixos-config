{ self, ... }:
{
  flake.wrappers.niri = { wlib, ... }: {
    imports = [
      wlib.wrapperModules.niri
    ];
  };

  flake.modules.nixos.niri = { pkgs, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    };
  };
}
