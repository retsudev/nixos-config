{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      # Basic aliases 
      ls = "ls --color=auto";
      ff = "clear && fastfetch";
      # NixOS flake.nix aliases
      nix-fswitch  = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
      nix-fbuild   = "sudo nixos-rebuild build --flake ~/nixos-config#nixos";
      nix-flist    = "nixos-rebuild list-generations";
      nix-fupdate  = "nix flake update"; 
      nix-fdelete  = "sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system";
      # NixOS home-manager standalone aliases
      home-fswitch  = "home-manager switch --flake ~/nixos-config#retsudev";
      home-fbuild   = "home-manager build --flake ~/nixos-config#retsudev";
      home-listgens = "home-manager generations";
      home-rmgens   = "home-manager remove-generations";
    };
  };
}


