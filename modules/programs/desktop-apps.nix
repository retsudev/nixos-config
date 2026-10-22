{ ... }:
{
  flake.modules.homeManager.desktop-apps = { pkgs, ... }: {
    home.pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };

    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-vaapi
        obs-pipewire-audio-capture
      ];
    };

    home.packages = with pkgs; [
      mpv
      adwaita-icon-theme
      cliphist
      nerd-fonts.symbols-only
    ];
  };
}
