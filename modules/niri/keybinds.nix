{ self, ... }:
{
  flake.modules.homeManager.niriKeybinds = { config, lib, pkgs, ... }:
  let
    system = pkgs.stdenv.hostPlatform.system;
    kitty = lib.getExe pkgs.kitty;
    zen = lib.getExe self.packages.${system}.zen-browser;
    yazi = lib.getExe pkgs.yazi;
    inir = lib.getExe config.programs.inir.package;
    inirAction = target: action: { spawn = [ inir target action ]; };
  in {
    wayland.windowManager.niri.settings = {
      gestures.hot-corners.off = { };

      binds = {
      # ── Навигация ──
      "Mod+Left".focus-column-left = { };
      "Mod+Right".focus-column-right = { };
      "Mod+Up".focus-window-up = { };
      "Mod+Down".focus-window-down = { };

      # ── Перемещение окон ──
      "Mod+Ctrl+Left".move-column-left = { };
      "Mod+Ctrl+Right".move-column-right = { };
      "Mod+Ctrl+Up".move-window-up = { };
      "Mod+Ctrl+Down".move-window-down = { };

      # ── Изменение размера ──
      "Mod+Shift+Left".set-column-width = "-10%";
      "Mod+Shift+Right".set-column-width = "+10%";
      "Mod+Shift+Up".set-window-height = "-10%";
      "Mod+Shift+Down".set-window-height = "+10%";

      # ── Закрытие / завершение ──
      "Mod+Q".close-window = { };
      "Mod+Shift+Q".quit = { };

      # ── Плавающее окно ──
      "Mod+F".toggle-window-floating = { };

      # ── iNiR ──
      "Mod+O" = inirAction "orbit" "toggle";
      "Mod+Space" = inirAction "overview" "toggle";
      "Mod+Shift+Space" = inirAction "controlPanel" "toggle";
      "Mod+A" = inirAction "sidebarLeft" "toggle";
      "Mod+N" = inirAction "sidebarRight" "toggle";
      "Mod+Slash" = inirAction "cheatsheet" "toggle";
      "Mod+V" = inirAction "clipboard" "toggle";
      "Mod+Comma" = { spawn = [ inir "settings" ]; };
      "Mod+L" = inirAction "lock" "activate";
      "XF86PowerOff" = inirAction "lock" "activate";
      "Mod+Alt+L" = { spawn = [ inir "colorMode" "set" "toggle" ]; };
      "Mod+F12" = inirAction "gamemode" "toggle";
      "Mod+Shift+Escape" = inirAction "session" "toggle";
      "Mod+Alt+Space" = inirAction "mpris" "playPause";

      "XF86MonBrightnessDown" = inirAction "brightness" "decrement";
      "XF86MonBrightnessUp" = inirAction "brightness" "increment";
      "Mod+S" = { spawn = [ inir "desktopAction" "screenshot" ]; };
      "Mod+Shift+S" = inirAction "region" "screenshot";
      "Mod+Shift+T" = inirAction "region" "ocr";
      "Mod+Shift+R" = inirAction "region" "record";

      "XF86AudioMicMute" = inirAction "audio" "micMute";
      "XF86AudioMute" = inirAction "audio" "mute";
      "XF86AudioLowerVolume" = inirAction "audio" "volumeDown";
      "XF86AudioRaiseVolume" = inirAction "audio" "volumeUp";

      # ── Запуск приложений ──
      "Mod+T" = { spawn = [ kitty ]; };
      "Mod+W" = { spawn = [ zen ]; };
      "Mod+E" = { spawn = [ kitty "-e" yazi ]; };

      # ── Рабочие пространства ──
      "Mod+Tab".toggle-overview = { };

      "Mod+1".focus-workspace = 1;
      "Mod+2".focus-workspace = 2;
      "Mod+3".focus-workspace = 3;
      "Mod+4".focus-workspace = 4;
      "Mod+5".focus-workspace = 5;
      "Mod+6".focus-workspace = 6;
      "Mod+7".focus-workspace = 7;
      "Mod+8".focus-workspace = 8;
      "Mod+9".focus-workspace = 9;
      "Mod+0".focus-workspace = 10;

      "Mod+Shift+1".move-column-to-workspace = 1;
      "Mod+Shift+2".move-column-to-workspace = 2;
      "Mod+Shift+3".move-column-to-workspace = 3;
      "Mod+Shift+4".move-column-to-workspace = 4;
      "Mod+Shift+5".move-column-to-workspace = 5;
      "Mod+Shift+6".move-column-to-workspace = 6;
      "Mod+Shift+7".move-column-to-workspace = 7;
      "Mod+Shift+8".move-column-to-workspace = 8;
      "Mod+Shift+9".move-column-to-workspace = 9;
      "Mod+Shift+0".move-column-to-workspace = 10;

      "Mod+Ctrl+1".move-window-to-workspace = { _props.focus = false; _args = [ 1 ]; };
      "Mod+Ctrl+2".move-window-to-workspace = { _props.focus = false; _args = [ 2 ]; };
      "Mod+Ctrl+3".move-window-to-workspace = { _props.focus = false; _args = [ 3 ]; };
      "Mod+Ctrl+4".move-window-to-workspace = { _props.focus = false; _args = [ 4 ]; };
      "Mod+Ctrl+5".move-window-to-workspace = { _props.focus = false; _args = [ 5 ]; };
      "Mod+Ctrl+6".move-window-to-workspace = { _props.focus = false; _args = [ 6 ]; };
      "Mod+Ctrl+7".move-window-to-workspace = { _props.focus = false; _args = [ 7 ]; };
      "Mod+Ctrl+8".move-window-to-workspace = { _props.focus = false; _args = [ 8 ]; };
      "Mod+Ctrl+9".move-window-to-workspace = { _props.focus = false; _args = [ 9 ]; };
      "Mod+Ctrl+0".move-window-to-workspace = { _props.focus = false; _args = [ 10 ]; };
      };
    };
  };
}
