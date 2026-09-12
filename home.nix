{
  pkgs,
  inputs,
  zen-browser,
  pyroclear,
  ...
}:
{
  imports = [
    inputs.lazyvim.homeManagerModules.default
    ./pkgs/apps.nix
    ./pkgs/cli-tools.nix
    ./desktop/hyprland/hyprland.nix
    ./desktop/serpantinum.nix
    ./modules/git/git.nix
    ./modules/git/lazygit.nix
    ./modules/shell/fish.nix
    ./modules/shell/kitty.nix
    ./modules/shell/starship.nix
    ./modules/programs/lazyvim/default.nix
    ./modules/programs/obsidian.nix
    ./modules/programs/obs.nix
    ./modules/programs/yazi.nix
    ./modules/misc/cursor.nix
  ];

  home = {
    username = "retsudev";
    homeDirectory = "/home/retsudev";
    stateVersion = "26.05";
  };

  # auto-delete generations older than 12h
  services.home-manager.autoExpire = {
    enable = true;
    frequency = "*-*-* 0/3:00:00";
    timestamp = "-72 hours";
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
    pulseaudio
    gcc
    cmake
    ninja
    clang-tools
  ]
  ++
  # Supported languages
  import ./pkgs/language-pkgs.nix {inherit pkgs; };
  fonts.fontconfig.enable = true;
}
