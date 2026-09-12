{ pkgs, ... }:
{
  programs.lazyvim = {
    enable = true;

    configFiles = ./lazyvim-config;

    extras.lang = import ./languages.nix;

    extraPackages = import ./lsp.nix { inherit pkgs; };

  };
}
