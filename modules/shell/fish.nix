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

    programs.fish.functions."cpp-parallel" = {
      description = "Enter the parallel C++ development shell";
      body = "nix develop /home/retsudev/nix-config#parallel-cpp $argv";
    };

    home.packages = with pkgs; [ eza ];
  };
}
