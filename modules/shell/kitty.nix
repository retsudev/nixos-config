{ ... }:
{
  flake.modules.homeManager.kitty = { pkgs, ... }: {
    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 14;
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
      settings = {
        shell = "${pkgs.fish}/bin/fish";
        window_padding_width = 10;
        remember_window_size = false;
      };
      shellIntegration.enableFishIntegration = true;
      extraConfig = ''
        # iNiR creates this file when it first applies terminal colors.
        # globinclude keeps Kitty usable before that initial theme generation.
        globinclude current-theme.conf
      '';
    };
  };
}
