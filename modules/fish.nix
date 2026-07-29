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
      cls = "clear";
      ff = "clear && fastfetch";
      #NixOS flake.nix aliases
      nixf-rs    = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
      nixf-rb    = "sudo nixos-rebuild build --flake ~/nixos-config#nixos";
      nixf-list  = "nixos-rebuild list-generations";
      nixf-updts = "nix flake update"; 
      nixf-dgens = "sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system";
      #NixOS home-manager standalone aliases
      home-sf   = "home-manager switch --flake ~/nixos-config#retsudev";
      home-bf   = "home-manager build --flake ~/nixos-config#retsudev";
      home-list = "home-manager generations";
      home-rm   = "home-manager remove-generations";
    };
  };
}


