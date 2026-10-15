{ ... }:
{
  programs.lazyvim = {
    enable = true;
    configFiles = ./lazyvim-config;
    extras.lang = import ./languages.nix;
  };
}
