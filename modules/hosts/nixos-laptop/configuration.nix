{ self, inputs, ...}: {
  flake.nixosModules.nixos-laptopConfiguration = {pkgs, lib, ... }: {
    imports = [
      self.nixosModules.nixos-laptopHardware
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
      git
      vim
    ];

    # Do not change it
    system.stateVersion = "26.05";
  };
}

