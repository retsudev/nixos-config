{...}: {
  flake.modules.homeManager.fish = {pkgs, ...}: {
    programs.fish = {
      enable = true;
      shellAliases = {
        ls = "eza --icons=auto";
        ll = "eza --long --header --git --icons=auto";
        la = "eza --all --long --header --git --icons=auto";
        lt = "eza --tree --icons=auto";
        gs = "git status -sb";
        gd = "git diff";
        gds = "git diff --staged";
        gl = "git log --oneline --graph --decorate -15";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        n = "nvim";
      };
      interactiveShellInit = ''
        set -g fish_greeting

        bind ctrl-backspace backward-kill-path-component
        bind alt-backspace backward-kill-path-component
        bind ctrl-l 'printf "\\e[3J\\e[H\\e[2J"; commandline -f repaint'
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

    home.packages = with pkgs; [eza];
  };
}
