{ self, ... }:
{
  flake.modules.homeManager.hyprlandKeybinds = { pkgs, lib, ... }:
  let
    system = pkgs.stdenv.hostPlatform.system;
    terminal = lib.getExe pkgs.kitty;
    browser = lib.getExe self.packages.${system}.zen-browser;
    fileManager = lib.getExe pkgs.yazi;
    workspaces = builtins.genList (index: index + 1) 10;
    workspaceKey = workspace: toString (if workspace == 10 then 0 else workspace);
    workspaceBinds = lib.concatMap (workspace: [
      "SUPER, ${workspaceKey workspace}, exec, serpantinum msg workspace ${toString workspace}"
      "SUPER SHIFT, ${workspaceKey workspace}, exec, serpantinum msg workspace ${toString workspace} move"
    ]) workspaces;
  in {
    wayland.windowManager.hyprland.settings = {
      bind = [
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER CTRL, left, movewindow, l"
        "SUPER CTRL, right, movewindow, r"
        "SUPER CTRL, up, movewindow, u"
        "SUPER CTRL, down, movewindow, d"
        "SUPER SHIFT, left, resizeactive, -50 0"
        "SUPER SHIFT, right, resizeactive, 50 0"
        "SUPER SHIFT, up, resizeactive, 0 -50"
        "SUPER SHIFT, down, resizeactive, 0 50"
        "SUPER, q, killactive"
        "SUPER SHIFT, q, exit"
        "SUPER, f, togglefloating"
        "SUPER, t, exec, ${terminal}"
        "SUPER, w, exec, ${browser}"
        "SUPER, e, exec, ${terminal} -e ${fileManager}"
        "SUPER, r, exec, serpantinum reload"
        "SUPER, c, exec, serpantinum msg toggle clipboard"
        "SUPER, space, exec, serpantinum msg toggle launcher"
        "SUPER SHIFT, space, exec, serpantinum msg toggle system"
        "SUPER, b, exec, serpantinum msg toggle system"
        "SUPER, m, exec, serpantinum msg toggle music"
        "SUPER ALT, space, exec, serpantinum msg toggle music"
        "SUPER, p, exec, serpantinum msg toggle wallpaper"
        "SUPER, o, exec, serpantinum msg toggle wallpaper"
        "SUPER, d, exec, serpantinum msg toggle calendar"
        "SUPER, n, exec, serpantinum msg toggle network"
        "SUPER, v, exec, serpantinum msg toggle clipboard"
        "SUPER ALT, v, exec, serpantinum msg toggle volume"
        "SUPER, g, exec, serpantinum msg toggle guide"
        "SUPER, slash, exec, serpantinum msg toggle settings"
        "SUPER, comma, exec, serpantinum msg toggle settings"
      ] ++ workspaceBinds;

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86PowerOff, exec, serpantinum lock"
        "SUPER, s, exec, serpantinum screenshot"
        "SUPER SHIFT, s, exec, serpantinum screenshot --edit"
      ];

      bindel = [
        "SUPER, l, exec, serpantinum lock"
        ", XF86MonBrightnessDown, exec, serpantinum brightness lower"
        ", XF86MonBrightnessUp, exec, serpantinum brightness raise"
        ", XF86AudioMicMute, exec, ${lib.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioMute, exec, serpantinum volume mute-toggle"
        ", XF86AudioLowerVolume, exec, serpantinum volume lower"
        ", XF86AudioRaiseVolume, exec, serpantinum volume raise"
      ];
    };
  };
}
