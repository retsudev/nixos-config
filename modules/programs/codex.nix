{ ... }:

{
  flake.modules.nixos.codex = { ... }:
    {
      security.allowUserNamespaces = true;
    };

  flake.modules.homeManager.codex = { inputs, pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
    in
    {
      home.packages = [
        # Codex CLI — native Rust binary
        inputs.codex-cli-nix.packages.${system}.default

        # Linux sandbox
        pkgs.bubblewrap
      ];
    };
}
