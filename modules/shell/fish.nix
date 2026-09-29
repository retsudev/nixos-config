{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      zoxide init fish | source
      bind ctrl-backspace backward-kill-path-component
      bind alt-backspace backward-kill-path-component
    '';
    shellAliases = {
      # Basic aliases
      c = "pyroclear";
      n = "nvim";
      ff = "clear && fastfetch";
      conf = "cd && cd nixos-config/";
      nconf = "cd && cd nixos-config/modules/programs/lazyvim";
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

      # Files
      ls = "eza";
      ll = "eza -lah --git";
      la = "eza -a";
      lt = "eza --tree --level=2";
      cat = "bat --paging=never";
      copycat = "bat --paging=never | wl-copy";

      # Git
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";
      lg = "lazygit";

      # Disk
      df = "duf";
      du = "dust";
    };
  };
}
