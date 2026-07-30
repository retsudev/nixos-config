{ pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    gtk.enable       = true;
    x11.enable       = true;
    hyprcursor.enable = true;

    package = pkgs.whitesur-cursors;
    name    = "WhiteSur-cursors";
    size    = 24;
  };
}
