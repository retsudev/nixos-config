{ ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    presets = [ "plain-text-symbols" ];
    settings = {
      add_newline = false;
    };
  };
}
