{ ... }:
{
  flake.modules.homeManager.kitty = { pkgs, ... }: {
    programs.kitty = {
      enable = true;
      font = {
        name = "Iosevka Nerd Font";
        size = 14;
        package = pkgs.nerd-fonts.iosevka;
      };
      settings = {
        shell = "${pkgs.fish}/bin/fish";
        window_padding_width = 10;
        remember_window_size = false;
      };
      extraConfig = ''
        include ~/.config/kitty/colors.conf
      '';
      shellIntegration.enableFishIntegration = true;
    };
  };
}
