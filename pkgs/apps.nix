{ pkgs, zen-browser, ... }:
{
  home.packages = with pkgs; [
    mpv
    qbittorrent
    zen-browser
    staruml
    onlyoffice-desktopeditors
  ];
}
