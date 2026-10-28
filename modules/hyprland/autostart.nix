{...}: {
  flake.modules.homeManager.hyprlandAutostart = {lib, ...}: {
    wayland.windowManager.hyprland.settings = {
      env = map (pair: {_args = pair;}) [
        ["XDG_CURRENT_DESKTOP" "Hyprland"]
        ["XDG_SESSION_TYPE" "wayland"]
        ["XDG_SESSION_DESKTOP" "Hyprland"]
      ];
      on._args = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''
          function()
            hl.exec_cmd("wl-paste --type text --watch cliphist store")
            hl.exec_cmd("wl-paste --type image --watch cliphist store")
            hl.exec_cmd("systemctl --user enable --now easyeffects")
          end
        '')
      ];
    };
  };
}
