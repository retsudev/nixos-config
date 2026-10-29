{...}: {
  flake.modules.homeManager.desktop-apps = {pkgs, ...}: {
    home.pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };

    home.packages = with pkgs; [
      mpv
      obsidian
      adwaita-icon-theme
      cliphist
      easyeffects
      nerd-fonts.symbols-only
    ];
  };
}
