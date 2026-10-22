{

  description = "RetsuDevs NixOS dendritic flake";

  inputs = {
    # pkg branches
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # dendritic flake deps
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrapper-modules = {
      url = "github:BirdeeHub/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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

    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  # import modules/ automatically
  outputs = inputs: inputs.flake-parts.lib.mkFlake
    {inherit inputs;}
    {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        inputs.flake-parts.flakeModules.modules
        inputs.wrapper-modules.flakeModules.wrappers
        (inputs.import-tree [
	  ./modules
	  ./hosts
	])
      ];
    };
}
