{ self, ... }:
{
  flake.wrappers.kitty = { pkgs, wlib, ... }: 
  let
    fish = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;
  in {
    imports = [ wlib.wrapperModules.kitty ];

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };

    settings = {
      shell = "${fish}/bin/fish";

      window_padding_width = 10;
      background_opacity = 0.68;
      remember_window_size = false;
    };

    # Runtime colors
    extraConfig = ''
      include ~/.config/kitty/themes/noctalia.conf
    '';
  };

  flake.modules.nixos.kitty = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.kitty
    ];

    fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
  };
}
