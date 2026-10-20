{ self, ... }:
{
  flake.wrappers.starship = { wlib, ... }: {
    imports = [ wlib.wrapperModules.starship ];

    preset = [ "nerd-font-symbols" ];
  };

  flake.modules.nixos.starship = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.starship
    ];
  };
}
