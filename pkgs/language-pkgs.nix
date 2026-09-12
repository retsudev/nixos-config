{ pkgs }:

with pkgs;
[
  # Nix
  nixd
  alejandra
  statix
  deadnix

  # Lua
  lua-language-server
  stylua

  # Python
  python3
  pyright
  ruff

  # C / C++
  clang-tools
  cmake
  ninja

  # Java
  jdk21
  jdt-language-server

  # Rust
  rustc
  cargo
  rust-analyzer
  rustfmt
  clippy

  # Utilities
  ripgrep
  fd
]
