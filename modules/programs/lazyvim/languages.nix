{
  nix.enable = true;

  python = {
    enable = true;
    installDependencies = true;
    installRuntimeDependencies = true;
  };

  rust = {
    enable = true;
    installDependencies = true;
    installRuntimeDependencies = true;
  };

  clangd = {
    enable = true;
    installDependencies = true;
  };

  cmake.enable = true;
}
