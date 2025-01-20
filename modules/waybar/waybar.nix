{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "menu_launcher" ''
      ${pkgs.wofi}/bin/wofi --show drun
    '')
  ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = ["custom/appmenu" "wlr/taskbar"];
        modules-center = ["hyprland/workspaces" "clock"];
        modules-right = ["cpu" "pulseaudio" "network" "custom/powermenu"];

        "custom/appmenu" = {
          format = "Menu {icon}";
          format-icon = "󰻀";
          rotate = 0;
          on-click = "menu_launcher";
        };

        "wlr/taskbar" = {
          format = "{icon}";
          tooltip = true;
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
          active-first = true;
        };
        "hyprland/workspaces" = {
          format = "{name} = {icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "active" = "";
            "default" = "";
          };
          persistent-workspaces = {
            "eDP-1" = [1 2 3 4 5];
          };
        };

        clock = {
          format = "{:%H:%M %p}";
          rotate = 0;
          format-alt = "{  %d·%m·%y}";
          tooltip-format = "<span>{calendar}</span>";
          calendar = {
            mode = "month";
            format = {
              months = "<span color='#ff6699'><b>{}</b></span>";
              "days" = "<span color='#cdd6f4'><b>{}</b></span>";
              "weekdays" = "<span color='#7CD37C'><b>{}</b></span>";
              "today" = "<span color='#ffcc66'><b>{}</b></span>";
            };
          };
        };
        cpu = {
          format = "{icon0} {icon1} {icon2} {icon3}";
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };

        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "default" = ["" "" ""];
          };
          "on-click" = "pamixer -t";
          "tooltip" = false;
        };

        network = {
          tooltip = true;
          rotate = 0;
          format-ethernet = " ";
          tooltip-format = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "󰖪 ";
          tooltip-format-disconnected = "Disconnected";
          format-alt = "<span foreground='#99ffdd'> {bandwidthDownBytes}</span> <span foreground='#ffcc66'> {bandwidthUpBytes}</span>";
          interval = 2;
        };
        "custom/powermenu" = {
          "format" = "";
          "on-click" = "pkill rofi || ~/.config/rofi/powermenu.sh";
          "tooltip" = false;
        };
      };
    };
  };
}
