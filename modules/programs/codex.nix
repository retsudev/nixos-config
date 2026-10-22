{ inputs, ... }:

{
  flake.modules.nixos.codex = { pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
    in
    {
      environment.systemPackages = [
        # Codex CLI — native Rust binary
        inputs.codex-cli-nix.packages.${system}.default

        # Linux sandbox
        pkgs.bubblewrap

        # Tools for repository work
        pkgs.git
        pkgs.ripgrep
        pkgs.fd
        pkgs.jq
      ];

      # Required by Codex's Bubblewrap sandbox.
      # This is also the default in current NixOS.
      security.allowUserNamespaces = true;
    };
}
