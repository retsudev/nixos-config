{ pkgs, nixpkgs-2605, ... }:

let
  pkgs-2605 = import nixpkgs-2605 {
    inherit (pkgs) system;
  };
in

  # This file is intented workaround!
  # Throne 1.2.2 from Unstable is broken
  # Thats why i use 26.05 until its fixed

{
  disabledModules = [
    "programs/throne.nix"
  ];

  imports = [
    "${nixpkgs-2605}/nixos/modules/programs/throne.nix"
  ];

  programs.throne = {
    enable = true;
    tunMode.enable = true;
    package = pkgs-2605.throne;
  };
}

