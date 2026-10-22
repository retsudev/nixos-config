{ self, ...}: {
  flake.modules.nixos.users = { pkgs, ... }: {
    users.users.retsudev = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
      initialPassword = "temp123";
    };
  };
}
