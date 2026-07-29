{ pkgs, inputs, zen-browser, ... }:
{
  imports = [
    inputs.lazyvim.homeManagerModules.default
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/lazygit.nix
    ./modules/lazyvim.nix
    ./modules/starship.nix
    ./modules/waybar.nix
  ]; 

	home = {
    username = "retsudev";
	  homeDirectory = "/home/retsudev";
	  stateVersion = "26.05";
  };
	
	programs.home-manager.enable = true;

	home.packages = with pkgs; [
	  nerd-fonts.jetbrains-mono
    fastfetch
    fuzzel
    obsidian
    grim
    wl-clipboard
    tree
    brightnessctl
    btop
    cmatrix
    zen-browser
	];

	fonts.fontconfig.enable = true;

}
