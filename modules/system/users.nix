{ ...}: {
  flake.modules.nixos.users = { pkgs, ... }: {
    programs.fish.enable = true;

    users.users.retsudev = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
      shell = pkgs.fish;
    };
  };
}
