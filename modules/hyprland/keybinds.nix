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
    toLua = lib.generators.toLua { };
    mkLuaInline = lib.generators.mkLuaInline;
    commandHandler = command: mkLuaInline "hl.dsp.exec_cmd(${toLua command})";
    bind = key: command: { _args = [ key (commandHandler command) ]; };
    bindLua = key: expression: { _args = [ key (mkLuaInline expression) ]; };
    lockedBind = key: command: {
      _args = [ key (commandHandler command) { locked = true; } ];
    };
    repeatingLockedBind = key: command: {
      _args = [ key (commandHandler command) { locked = true; repeating = true; } ];
    };
    workspaceBinds = lib.concatMap (workspace: let
      key = workspaceKey workspace;
      number = toString workspace;
    in [
      (bind "SUPER + ${key}" "serpantinum msg workspace ${number}")
      (bind "SUPER + SHIFT + ${key}" "serpantinum msg workspace ${number} move")
    ]) workspaces;
  in {
    wayland.windowManager.hyprland.settings.bind = [
      (bind "SUPER + left" "hyprctl dispatch movefocus l")
      (bind "SUPER + right" "hyprctl dispatch movefocus r")
      (bind "SUPER + up" "hyprctl dispatch movefocus u")
      (bind "SUPER + down" "hyprctl dispatch movefocus d")
      (bindLua "SUPER + code:43" "hl.dsp.focus({ direction = 'left' })")
      (bindLua "SUPER + code:44" "hl.dsp.focus({ direction = 'down' })")
      (bindLua "SUPER + code:45" "hl.dsp.focus({ direction = 'up' })")
      (bindLua "SUPER + code:46" "hl.dsp.focus({ direction = 'right' })")
      (bind "SUPER + CTRL + left" "hyprctl dispatch movewindow l")
      (bind "SUPER + CTRL + right" "hyprctl dispatch movewindow r")
      (bind "SUPER + CTRL + up" "hyprctl dispatch movewindow u")
      (bind "SUPER + CTRL + down" "hyprctl dispatch movewindow d")
      (bindLua "SUPER + SHIFT + left" "hl.dsp.window.resize({ x = -50, y = 0, relative = true })")
      (bindLua "SUPER + SHIFT + right" "hl.dsp.window.resize({ x = 50, y = 0, relative = true })")
      (bindLua "SUPER + SHIFT + up" "hl.dsp.window.resize({ x = 0, y = -50, relative = true })")
      (bindLua "SUPER + SHIFT + down" "hl.dsp.window.resize({ x = 0, y = 50, relative = true })")
      (bindLua "SUPER + q" "hl.dsp.window.close()")
      (bindLua "SUPER + SHIFT + q" "hl.dsp.window.kill()")
      (bindLua "SUPER + CTRL + F" "hl.dsp.window.fullscreen({ action = 'toggle' })")
      (bindLua "SUPER + SHIFT + F" "hl.dsp.window.fullscreen({ action = 'toggle' })")
      (bindLua "SUPER + f" ''
        function()
          local w = hl.get_active_window()
          if w == nil then return end
          if not w.floating then
            hl.dispatch(hl.dsp.window.float({ action = "set" }))
            hl.dispatch(hl.dsp.window.resize({ x = 800, y = 600, relative = false }))
            hl.dispatch(hl.dsp.window.center())
          else
            hl.dispatch(hl.dsp.window.float({ action = "unset" }))
          end
        end
      '')
      (bind "SUPER + t" terminal)
      (bind "SUPER + w" "zen")
      (bind "SUPER + e" "${terminal} -e ${fileManager}")
      (bind "SUPER + r" "serpantinum reload")
      (bind "SUPER + c" "serpantinum msg toggle clipboard")
      (bind "SUPER + space" "serpantinum msg toggle launcher")
      (bind "SUPER + SHIFT + space" "serpantinum msg toggle system")
      (bind "SUPER + b" "serpantinum msg toggle system")
      (bind "SUPER + m" "serpantinum msg toggle music")
      (bind "SUPER + ALT + space" "serpantinum msg toggle music")
      (bind "SUPER + p" "serpantinum msg toggle wallpaper")
      (bind "SUPER + o" "serpantinum msg toggle wallpaper")
      (bind "SUPER + d" "serpantinum msg toggle calendar")
      (bind "SUPER + n" "serpantinum msg toggle network")
      (bind "SUPER + v" "serpantinum msg toggle clipboard")
      (bind "SUPER + ALT + v" "serpantinum msg toggle volume")
      (bind "SUPER + g" "serpantinum msg toggle guide")
      (bind "SUPER + slash" "serpantinum msg toggle settings")
      (bind "SUPER + comma" "serpantinum msg toggle settings")
    ] ++ workspaceBinds ++ [
        {
          _args = [
            "SUPER + mouse:272"
            (mkLuaInline "hl.dsp.window.drag()")
            { mouse = true; }
          ];
        }
        {
          _args = [
            "SUPER + mouse:273"
            (mkLuaInline "hl.dsp.window.resize()")
            { mouse = true; }
          ];
        }
        (lockedBind "XF86PowerOff" "serpantinum lock")
        (lockedBind "SUPER + s" "serpantinum screenshot")
        (lockedBind "SUPER + SHIFT + s" "serpantinum screenshot --full")
        (repeatingLockedBind "SUPER + SHIFT + L" "serpantinum lock")
        (repeatingLockedBind "XF86MonBrightnessDown" "serpantinum brightness lower")
        (repeatingLockedBind "XF86MonBrightnessUp" "serpantinum brightness raise")
        (lockedBind "XF86AudioMicMute" "serpantinum volume mic-toggle")
        (repeatingLockedBind "XF86AudioMute" "serpantinum volume mute-toggle")
        (repeatingLockedBind "XF86AudioLowerVolume" "serpantinum volume lower")
        (repeatingLockedBind "XF86AudioRaiseVolume" "serpantinum volume raise")
    ];
  };
}
