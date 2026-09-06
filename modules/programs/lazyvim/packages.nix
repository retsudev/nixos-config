{ pkgs }:

with pkgs; [
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
