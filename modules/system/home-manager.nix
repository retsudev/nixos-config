{ inputs, self, ... }:
{
  flake.modules.nixos.home-manager = { config, ... }: {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "hm-backup-previous";
      extraSpecialArgs = {
        inherit inputs;
        niriPackage = config.programs.niri.package;
      };
      users.retsudev = self.modules.homeManager.retsudev;
    };
  };
}
