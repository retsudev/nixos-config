{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      zen = "zen & disown";
      ls = "ls --color=auto";
      vpn = "Throne & disown";
    };
  };
}


