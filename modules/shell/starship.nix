{...}: {
  flake.modules.homeManager.starship = {config, lib, ...}: {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      # Serpantinum updates the palette in this file when app theming is on.
      # Keep it writable outside the Nix store so those generated values persist.
      settings = {};
    };

    xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink
      "${config.xdg.dataHome}/serpantinum/starship.toml";

    home.activation.ensureWritableStarshipConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p "${config.xdg.dataHome}/serpantinum"
      if [ ! -e "${config.xdg.dataHome}/serpantinum/starship.toml" ]; then
        ${config.programs.starship.package}/bin/starship preset nerd-font-symbols \
          > "${config.xdg.dataHome}/serpantinum/starship.toml"
        sed -i '1i add_newline = false' "${config.xdg.dataHome}/serpantinum/starship.toml"
      fi
    '';
  };
}
