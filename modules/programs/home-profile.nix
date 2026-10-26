{ self, ... }:
{
  flake.modules.homeManager.retsudev = { pkgs, ... }: {
    imports = [
      self.modules.homeManager.cli-tools
      self.modules.homeManager.developer-tools
      self.modules.homeManager.desktop-apps
      self.modules.homeManager.workflow-tools
      self.modules.homeManager.fish
      self.modules.homeManager.kitty
      self.modules.homeManager.starship
      self.modules.homeManager.hyprland
      self.modules.homeManager.serpantinum
      self.modules.homeManager.studio-package
      self.modules.homeManager.zen-browser
      self.modules.homeManager.codex
      self.modules.homeManager.music-dl
    ];

    home = {
      username = "retsudev";
      homeDirectory = "/home/retsudev";
      stateVersion = "26.05";
      sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };
      packages = with pkgs; [
        corefonts
        font-awesome
        nerd-fonts.iosevka
      ];
    };

    fonts.fontconfig = {
      enable = true;
      defaultFonts.monospace = [ "Iosevka Nerd Font" ];
    };
    programs.home-manager.enable = true;
    home.enableNixpkgsReleaseCheck = false;
    services.home-manager.autoExpire = {
      enable = true;
      frequency = "*-*-* 0/3:00:00";
      timestamp = "-72 hours";
    };
  };
}
