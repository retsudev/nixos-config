{ self, inputs, ... }: {

  flake.nixosConfigurations.nixos-laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.nixos-laptopConfiguration
    ];
  };

}
