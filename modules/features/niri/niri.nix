{ self, inputs, ... }: {
  perSystem = { pkgs, lib, ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;

      imports = [
        self.wrappersModules.niri
      ];

      settings = {
        input.keyboard = {
          xkb.layout = "us,ru";
        };

        layout.gaps = 5;

        binds = {
          "Mod+T".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = _: { };
        };
      };
    };
  };
}
