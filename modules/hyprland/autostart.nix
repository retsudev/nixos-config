{ ... }:
{
  flake.modules.homeManager.hyprlandAutostart = { ... }: {
    wayland.windowManager.hyprland.settings = {
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      exec-once = [
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "systemctl --user enable --now easyeffects"
        "serpantinumd start"
      ];
    };
  };
}
