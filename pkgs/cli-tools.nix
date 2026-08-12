{ pkgs, ... }:
{
  home.packages = with pkgs; [
    terminal-toys
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
