{ self, ...}: {
  flake.modules.nixos.users = { pkgs, ... }: {
    users.users.retsudev = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
      shell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;
    };
  };
}
