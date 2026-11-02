{...}: {
  flake.modules.nixos.file-transport = {
    services.udisks2.enable = true;
    services.gvfs.enable = true;
  };

  flake.modules.homeManager.file-transport = {pkgs, ...}: {
    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
    };

    home.packages = [pkgs.gvfs];
  };
}
