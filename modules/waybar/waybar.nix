{
  programs.waybar = {
    #enable = true;
    settings = {
      mainBar = {
        layer = "bottom";
        position = "bottom";
        height = 30;
        output = [
          "eDP-1"
        ];

        modules-left = ["sway/workspaces"];
        modules-right = ["pulseaudio" "network" "battery" "custom/date" "clock" "custom/power"];
        "sway/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "format" = "{icon}";
          "persistent_workspaces" = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
            "10" = [];
          };
          "format-icons" = {
            "1" = "󰋜";
            "2" = "󰈹";
            "3" = "󰠮";
            "4" = "󰭹";
            "5" = "󱓷";
            "6" = "󱇧";
            "7" = "󰊢";
            "8" = "󰖲";
            "9" = "󰕧";
            "10" = "󰝚";
          };
        };
        "custom/date" = {
          "format" = "󰸗 {}";
          "interval" = 3600;
          "exec" = "$HOME/bin/waybar-date.sh";
        };
        "custom/power" = {
          "format" = "󰐥";
          "on-click" = "$HOME/bin/waybar-power.sh";
        };
        "clock" = {
          "format" = "󰅐 {:%H:%M}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%Y-%m-%d}";
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = "󰂄 {capacity}%";
          "format-plugged" = "󰂄{capacity}%";
          "format-alt" = "{time} {icon}";
          "format-full" = "󱈑 {capacity}%";
          "format-icons" = ["󱊡" "󱊢" "󱊣"];
        };
        "network" = {
          "format-wifi" = "  {essid}";
          "format-ethernet" = "{ifname}: {ipaddr}/{cidr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "󰤮 Disconnected";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          "format" = "{icon}  {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
          "on-click" = "pavucontrol";
        };
      };
    };
    style = ''
           * {
        border: none;
        border-radius: 0;
        font-family: monospace;
        font-size: 14px;
        min-height: 0;
        }

        window#waybar {
        background: #3b4252;
        color: white;
        }

        #workspaces {
            background-color: #4c566a;
            margin: 5px;
            margin-left: 10px;
            border-radius: 5px;
        }
        #workspaces button {
        padding: 0 10px;
        color: #eceff4;
        }

        #workspaces button.focused {
        color: #2e3440;
        background-color: #88c0d0;
        border-radius: 5px;
        }

      #workspaces button:hover {
            background-color: #5e81ac;
            border-radius: 5px;
      }

      #custom-date, #clock, #battery, #pulseaudio, #network {
            background-color: #4c566a;
            padding: 0px 10px;
            margin: 5px 0px;
      }

      #custom-date {
            color: #8fbcbb;
      }

      #custom-power {
            color: #2e3440;
            background-color: #bf616a;
            border-radius: 5px;
            margin-right: 10px;
            margin-top: 5px;
            margin-bottom: 5px;
            margin-left: 0px;
            padding: 0px 10px;
      }

      #clock {
        color: #b48ead;
        border-radius: 0px 5px 5px 0px;
        margin-right: 10px;
      }

      #battery {
        color: #a3be8c;
      }

      @keyframes blink {
        to {
            background-color: #ffffff;
            color: black;
        }
      }

      #battery.charging {
        color: #a3be8c;
      }

      #battery.critical:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #network {
            color: #d08770;
      }

      #pulseaudio {
            color: #ebcb8b;
            border-radius: 5px 0px 0px 5px;
      }

    '';
  };
}
