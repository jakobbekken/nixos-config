{ ... }:

{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 32;
      modules-left = [
        "clock"
        "custom/weather"
      ];
      modules-center = [
        "niri/workspaces"
      ];
      modules-right = [
        "pulseaudio"
        "battery"
      ];

      "niri/workspaces" = {
        format = "";
        active-only = false;
        all-outputs = false;
      };

      "custom/weather" = {
        format = " {}";
        exec = "curl -s 'wttr.in/Grimstad,Norway?format=%t' | sed 's/+//'";
        interval = 1800;
      };

      "clock" = {
        format = "󰥔 {:%H:%M}";
        format-alt = " {:%d-%m-%Y}";
        interval = 60;
      };

      "battery" = {
        states = {
          critical = 15;
        };
        format = "󰁹 {capacity}%";
        format-charging = "󱐋 {capacity}%";
        format-plugged = "󱐋 {capacity}%";
        interval = 5;
      };

      "pulseaudio" = {
        format = "󰕾 {volume}%";
        format-bluetooth = "󰂰 {volume}%";
        format-bluetooth-muted = "󰂲 {volume}%";
        format-muted = "󰖁 {volume}%";
        on-click = "pavucontrol";
      };
    };
    systemd.enable = true;

    style = builtins.readFile ./waybar-style.css;
  };
}
