{ inputs, self, ... }:
{
  perSystem = { pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      zen = inputs.zen-browser.packages.${system};
    in
    {
      packages.zen-browser = zen.default;
    };

  flake.modules.homeManager.zen-browser = { pkgs, ... }: {
    home.packages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser ];
  };
}
