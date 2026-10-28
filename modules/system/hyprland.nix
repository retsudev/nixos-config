{...}: {
  flake.modules.nixos.hyprland = {pkgs, ...}: {
    programs.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      withUWSM = false;
      xwayland.enable = true;
    };
  };
}
