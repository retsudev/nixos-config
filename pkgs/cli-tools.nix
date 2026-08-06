{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    tree
    brightnessctl
    btop
    playerctl
    cmatrix
    cava
    tty-clock
    wl-clipboard
    grim
  ];
}
