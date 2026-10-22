{ self, inputs, ... }: {

  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.laptopConfiguration
      self.modules.nixos.studio
      self.modules.nixos.desktop
      self.modules.nixos.throne
      self.modules.nixos.users
      self.modules.nixos.codex
      self.modules.nixos.home-manager
    ];
  };

}
