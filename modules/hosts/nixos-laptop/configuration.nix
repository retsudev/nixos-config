{ self, inputs, ...}: {
  flake.nixosModules.nixos-laptopConfiguration = {pkgs, lib, ... }: {
    imports = [
      self.nixosModules.nixos-laptopHardware
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
      nvim
    ];
  };
}

