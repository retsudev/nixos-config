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

  java = {
    enable = true;
    installDependencies = true;
    installRuntimeDependencies = true;
  };

  cmake.enable = true;
}
