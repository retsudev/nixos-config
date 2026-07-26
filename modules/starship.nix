{ ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    presets = [ "nerd-font-symbols" ];
    settings = {
      add_newline = false;
    };
  };
}
