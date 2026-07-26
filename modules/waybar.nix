{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin = "4 6 0 6";
        spacing = 6;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "backlight" "battery" ];

        "hyprland/workspaces" = {
          format = "{id}";
          on-click = "activate";
          sort-by-number = true;
        };

        "clock" = {
          format = " {:%H:%M}";
          tooltip-format = "{:%A, %d %B %Y}";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = " muted";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        };

        "network" = {
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = " {ipaddr}";
          format-disconnected = "⚠ disconnected";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" ];
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
          format-charging = " {capacity}%";
          states = {
            warning = 20;
            critical = 10;
          };
        };
      };
    };

    style = ''
      @import "catppuccin.css";

      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
      }

      #workspaces,
      #clock,
      #pulseaudio,
      #network,
      #backlight,
      #battery {
        background-color: @mantle;
        border: 1px solid @surface0;
        border-radius: 12px;
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

      #pulseaudio, #network, #backlight, #battery {
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

  catppuccin.waybar.mode = "createLink";
}
