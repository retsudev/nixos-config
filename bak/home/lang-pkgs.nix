{ pkgs, ...}:
{
home.packages = with pkgs; [

  # Nix
  nixd
  alejandra
  statix
  deadnix

  # C / C++
  gcc
  clang-tools
  cmake
  ninja

  # Rust
  rustc
  cargo
  rust-analyzer
  rustfmt
  clippy

  # Java
  jdk21
  jdt-language-server
  ant

  # Lua
  lua
  luarocks
  stylua
  lua-language-server

  # Web-Dev-Stack
  live-server
  nodejs
  typescript
  vtsls
  vscode-langservers-extracted
  prettier

  # General
  ripgrep
  fd
];
}
