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
      nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
      nix-build = "sudo nixos-rebuild build --flake ~/nixos-config#nixos";
      nix-listgens = "nixos-rebuild list-generations";
      nix-deletegens = "sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system";
      # NixOS home-manager standalone aliases
      hm-switch = "home-manager switch --flake ~/nixos-config#retsudev";
      hm-build = "home-manager build --flake ~/nixos-config#retsudev";
      hm-gens = "home-manager generations";
      hm-deletegens = "home-manager remove-generations";
      # WG vpn commands
      vpn-off = "sudo systemctl stop wg-quick-romania wg-quick-germany wg-quick-france wg-quick-netherlands";

      vpn-romania     = "vpn-off; and sudo systemctl start wg-quick-romania";
      vpn-germany     = "vpn-off; and sudo systemctl start wg-quick-germany";
      vpn-france      = "vpn-off; and sudo systemctl start wg-quick-france";
      vpn-netherlands = "vpn-off; and sudo systemctl start wg-quick-netherlands";

      vpn-status = "sudo wg show";
    };
  };
}
