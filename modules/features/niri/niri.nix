{ self, inputs, ... }:
{
  flake.wrappers.niri = { pkgs, wlib, ... }: {
    imports = [
      wlib.wrapperModules.niri
    ];

    runtimePkgs = [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      self.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser
      pkgs.kitty
      pkgs.yazi
    ];
  };

  flake.modules.nixos.niri = { pkgs, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    };
  };
}
