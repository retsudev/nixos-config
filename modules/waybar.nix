{ ... }:

let
  icon = code: builtins.fromJSON ''"\u${code}"'';
  iconVolumeOff = icon "f026";
  iconVolumeLow = icon "f027";
  iconVolumeHigh = icon "f028";
  iconWifi = icon "f1eb";
  iconPlug = icon "f1e6";
  iconWarning = icon "f071";
  iconSun = icon "f185";
  iconCpu = icon "f2db";
  iconRam = icon "f4bc"; # nf-oct-cpu вместо сломанного nf-fa-memory
  iconBatteryEmpty = icon "f244";
  iconBatteryQuarter = icon "f243";
  iconBatteryHalf = icon "f242";
  iconBatteryThreeQuarters = icon "f241";
  iconBatteryFull = icon "f240";
  iconBolt = icon "f0e7";
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin = "4 20 0 20";
        spacing = 6;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "memory"
          "cpu"
          "pulseaudio"
          "backlight"
          "network"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{id}";
          on-click = "activate";
          sort-by = "number";
          persistent-workspaces."*" = [
            1
            2
            3
            4
            5
          ];
        };

        "clock" = {
          format = "{:%H:%M}";
          tooltip-format = "{:%A, %d %B %Y}";
        };

        "cpu" = {
          format = "${iconCpu} {usage}%";
          interval = 5;
        };

        "memory" = {
          format = "${iconRam} {percentage}%";
          interval = 5;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "${iconVolumeOff} muted";
          format-icons = {
            default = [
              iconVolumeOff
              iconVolumeLow
              iconVolumeHigh
            ];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        };

        "backlight" = {
          format = "${iconSun} {percent}%";
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };

        "network" = {
          format-wifi = "${iconWifi} {signalStrength}%";
          format-ethernet = "${iconPlug}";
          format-disconnected = "${iconWarning}";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [
            iconBatteryEmpty
            iconBatteryQuarter
            iconBatteryHalf
            iconBatteryThreeQuarters
            iconBatteryFull
          ];
          format-charging = "${iconBolt} {capacity}%";
          states = {
            warning = 20;
            critical = 10;
          };
        };
      };
    };

    style = ''
      @import "matugen.css";

      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12px;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
      }

      #workspaces,
      #clock,
      #cpu,
      #memory,
      #pulseaudio,
      #network,
      #backlight,
      #battery {
        background-color: @mantle;
        border: 1px solid @surface0;
        border-radius: 8px;
        margin: 4px 3px;
        padding: 4px 10px;
      }

      #workspaces {
        padding: 4px 6px;
      }

      #workspaces button {
        color: @subtext0;
        padding: 0 8px;
        margin: 0 2px;
        border-radius: 8px;
        min-width: 10px;
      }

      #workspaces button.empty {
        color: @surface0;
      }

      #workspaces button.active {
        color: @base;
        background-color: @mauve;
        font-weight: bold;
      }

      #workspaces button:hover {
        background-color: @surface0;
        color: @text;
      }

      #clock {
        color: @text;
        font-weight: bold;
      }

      #cpu, #memory, #pulseaudio, #backlight, #network, #battery {
        color: @text;
      }

      #pulseaudio.muted {
        color: @subtext0;
      }

      #network.disconnected {
        color: @red;
      }

      #battery.charging {
        color: @green;
      }

      #battery.warning {
        color: @peach;
      }

      #battery.critical {
        color: @red;
      }
    '';
  };
}
