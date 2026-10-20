{ inputs, ... }:
{
  perSystem = { pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      zen = inputs.zen-browser.packages.${system};
    in
    {
      packages.zen-browser = zen.default.override {
        zen-browser-unwrapped = zen.zen-browser-unwrapped.override {
          hash = "sha256-uyBF0+IWVNQP6EElAJLurf0sH8gx7vtQkiJ3PIvcoUk=";
        };
      };
    };
}
