{
  pkgs,
  inputs,
  zen-browser,
  ...
}:
{
  imports = [
    inputs.lazyvim.homeManagerModules.default
    ./pkgs/apps.nix
    ./pkgs/cli-tools.nix
    ./tools/qs-devkit.nix
    ./hyprland/hyprland.nix
    ./modules/fish.nix
    ./modules/obs.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/lazygit.nix
    ./modules/lazyvim.nix
    ./modules/starship.nix
    ./modules/waybar.nix
    ./modules/fuzzel.nix
    ./modules/cursor.nix
    ./modules/yazi.nix
  ];

  home = {
    username = "retsudev";
    homeDirectory = "/home/retsudev";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;

  # Global Editor
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Fonts
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  fonts.fontconfig.enable = true;

}
