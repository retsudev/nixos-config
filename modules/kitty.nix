{ ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
    extraConfig = ''
      include skwd-theme.conf
    '';
  };
}
