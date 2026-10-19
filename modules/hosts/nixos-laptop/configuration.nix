{ self, inputs, ...}: {
  flake.modules.nixos.nixos-laptopConfiguration = {pkgs, lib, ... }: {
    imports = [
      self.modules.nixos.nixos-laptopHardware
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
      git
      vim
    ];

    # Do NOT change it
    system.stateVersion = "26.05";
  };
}

