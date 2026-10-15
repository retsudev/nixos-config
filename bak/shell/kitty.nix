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
      background_opacity = "0.68";
    };
    extraConfig = ''
      include ~/.config/kitty/colors.conf
      remember_window_size no
    '';
  };
}
