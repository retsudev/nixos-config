{
  description = "RetsuDevs NixOS dendritic flake";

  inputs = {
    # pkg branches
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # dendritic flake deps
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    # additional programs
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    codex-cli-nix = {
      url = "github:sadjow/codex-cli-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    undo.url = "github:edaywalid/undo";

    serpantinum.url = "github:ilyamiro/serpantinum";
  };

  # import flake-parts automatically
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        inputs.flake-parts.flakeModules.modules
        (inputs.import-tree [
          ./modules
          ./hosts
          ./lazyvim
        ])
      ];
    };
}
