{ self, inputs, ... }: {

  flake.nixosConfigurations.nixos-laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.nixos-laptopConfiguration
      self.modules.nixos.desktop
      self.modules.nixos.throne
      self.modules.nixos.users
      self.modules.nixos.codex
    ];
  };

}
