{ pkgs, zen-browser, ... }:
{
  home.packages = with pkgs; [
    obsidian
    mpv
    qbittorrent
    zen-browser
  ];
}
