{ ... }:
{
  flake.modules.nixos.studio = { ... }: {
    hardware.opentabletdriver.enable = true;
    hardware.uinput.enable = true;
    boot.kernelModules = [ "uinput" ];
  };

  flake.modules.homeManager.studio-package = { pkgs, ... }: {
    home.packages = with pkgs; [ krita blender ];
  };
}
