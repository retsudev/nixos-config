{ pkgs, ...}:
{
home.packages = with pkgs; [

  # Nix
  nixd
  alejandra
  statix
  deadnix

  # C / C++
  clang
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

  # Web-Dev-Stack
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
