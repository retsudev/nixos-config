{ ... }:
{
  flake.modules.homeManager.fish = { pkgs, ... }: {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting

        bind ctrl-backspace backward-kill-path-component
        bind alt-backspace backward-kill-path-component

        if test -f ~/.config/fish/aliases.fish
          source ~/.config/fish/aliases.fish
        end
      '';
    };

    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    home.packages = with pkgs; [ eza ];
  };
}
