{...}: {
  flake.modules.nixos.hyprland = {pkgs, ...}: {
    programs.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      withUWSM = false;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };
  };
}
