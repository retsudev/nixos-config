{ ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        terminal = "kitty";
        layer = "overlay";
        width = 40;
        lines = 8;
        "horizontal-pad" = 20;
        "vertical-pad" = 12;
        "inner-pad" = 8;
      };
      border = {
        width = 2;
        radius = 8;
      };
    };
  };
}
