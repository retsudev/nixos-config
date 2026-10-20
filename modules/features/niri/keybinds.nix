{ ... }:
{
  flake.wrappers.niri = { lib, pkgs, ... }: {
    settings.gestures.hot-corners = {
      off = _: { };
    };

    settings.binds = {
      # ── Навигация ──
      "Mod+Left".focus-column-left = _: { };
      "Mod+Right".focus-column-right = _: { };
      "Mod+Up".focus-window-up = _: { };
      "Mod+Down".focus-window-down = _: { };

      # ── Перемещение окон ──
      "Mod+Ctrl+Left".move-column-left = _: { };
      "Mod+Ctrl+Right".move-column-right = _: { };
      "Mod+Ctrl+Up".move-window-up = _: { };
      "Mod+Ctrl+Down".move-window-down = _: { };

      # ── Изменение размера ──
      "Mod+Shift+Left".set-column-width = "-10%";
      "Mod+Shift+Right".set-column-width = "+10%";
      "Mod+Shift+Up".set-window-height = "-10%";
      "Mod+Shift+Down".set-window-height = "+10%";

      # ── Закрытие / завершение ──
      "Mod+Q".close-window = _: { };
      "Mod+Shift+Q".quit = _: { };

      # ── Плавающее окно ──
      "Mod+F".toggle-window-floating = _: { };

      # ── Яркость ──
      "XF86MonBrightnessDown".spawn-sh =
        "noctalia msg brightness-down current 5%";
      "XF86MonBrightnessUp".spawn-sh =
        "noctalia msg brightness-up current 5%";

      # ── Скриншоты ──
      "Mod+S".spawn-sh = "noctalia msg screenshot-region";
      "Mod+Shift+S".spawn-sh = "noctalia msg screenshot-fullscreen";

      # ── Блокировка ──
      "XF86PowerOff".spawn-sh = "noctalia msg session lock";
      "Mod+L".spawn-sh = "noctalia msg session lock";

      # ── Аудио ──
      "XF86AudioMicMute".spawn-sh = "noctalia msg mic-mute";
      "XF86AudioMute".spawn-sh = "noctalia msg volume-mute";
      "XF86AudioLowerVolume".spawn-sh = "noctalia msg volume-down";
      "XF86AudioRaiseVolume".spawn-sh = "noctalia msg volume-up";

      # ── Запуск приложений ──
      "Mod+T".spawn-sh = lib.getExe pkgs.kitty;
      "Mod+W".spawn-sh = "zen";
      "Mod+E".spawn-sh = "${lib.getExe pkgs.kitty} -e yazi";

      # ── Рабочие пространства ──
      "Mod+Tab".toggle-overview = _: { };

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

      "Mod+Ctrl+1".move-window-to-workspace = _: {
        props = [{ focus = false; } 1];
      };

      "Mod+Ctrl+2".move-window-to-workspace = _: {
        props = [{ focus = false; } 2];
      };

      "Mod+Ctrl+3".move-window-to-workspace = _: {
        props = [{ focus = false; } 3];
      };

      "Mod+Ctrl+4".move-window-to-workspace = _: {
        props = [{ focus = false; } 4];
      };

      "Mod+Ctrl+5".move-window-to-workspace = _: {
        props = [{ focus = false; } 5];
      };

      "Mod+Ctrl+6".move-window-to-workspace = _: {
        props = [{ focus = false; } 6];
      };

      "Mod+Ctrl+7".move-window-to-workspace = _: {
        props = [{ focus = false; } 7];
      };

      "Mod+Ctrl+8".move-window-to-workspace = _: {
        props = [{ focus = false; } 8];
      };

      "Mod+Ctrl+9".move-window-to-workspace = _: {
        props = [{ focus = false; } 9];
      };

      "Mod+Ctrl+0".move-window-to-workspace = _: {
        props = [{ focus = false; } 10];
      };
    };
  };
}
