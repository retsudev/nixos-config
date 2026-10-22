{ ... }:
{
  flake.modules.homeManager.developer-tools = { pkgs, ... }: {
    home.packages = with pkgs; [
      gcc
      alejandra
      statix
      deadnix
      cmake
      ninja
      rustc
      cargo
      rustfmt
      clippy
      jdk21
      ant
      lua
      luarocks
      stylua
      live-server
      nodejs
      typescript
      prettier
    ];
  };
}
