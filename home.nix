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
    ./modules/fuzzel.nix
    ./modules/cursor.nix
    ./hyprland/hyprland.nix
  ]; 

	home = {
    username = "retsudev";
	  homeDirectory = "/home/retsudev";
	  stateVersion = "26.05";
  };
	
	programs.home-manager.enable = true;
 
  home.enableNixpkgsReleaseCheck = false;

	home.packages = with pkgs; [
	  nerd-fonts.jetbrains-mono
    fastfetch 
    obsidian
    grim
    wl-clipboard
    tree
    brightnessctl
    btop
    playerctl
    cmatrix
    zen-browser
	];

	fonts.fontconfig.enable = true;

}
