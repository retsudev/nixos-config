{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        margin = "8 12 0 12";
        spacing = 8;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "backlight" "battery" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            active = "";
            default = "";
          };
        };

        "clock" = {
          format = "{:%H:%M}";
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
          format-wifi = " {essid}";
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
        font-size: 14px;
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
        border-radius: 14px;
        margin: 4px 3px;
        padding: 0 12px;
      }

      #workspaces {
        padding: 3px 6px;
      }

      #workspaces button {
        color: @subtext0;
        padding: 0 6px;
        border-radius: 10px;
      }

      #workspaces button.active {
        color: @base;
        background-color: @mauve;
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
