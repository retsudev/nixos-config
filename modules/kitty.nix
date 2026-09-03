{ ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
    settings = {
      window_padding_width = 10;
    };
    extraConfig = ''
      include ~/.config/kitty/colors.conf
    '';
  };
}
