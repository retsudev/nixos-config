{ pkgs, zen-browser, ... }:
{
  home.packages = with pkgs; [
    mpv
    zen-browser
  ];
}
