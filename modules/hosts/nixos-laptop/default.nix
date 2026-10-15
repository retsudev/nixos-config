{ self, inputs, ... }: {

  flake.nixosConfigurations.nixos-laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.nixos-laptopConfiguration
    ];
  };

}
