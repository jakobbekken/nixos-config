{
  services.polybar = {
    enable = true;
    script = "";
    settings = {
      "bar/main" = {
        monitor = "";
        width = "100%";
        height = "36px";

        padding = 2;
        module-margin = 2;

        background = "#191724";
        foreground = "#e0def4";

        font = [
          "FiraCode Nerd Font:pixelsize=14;2"
        ];

        active-font = 0;

        wm-restack = "bspwm";

        modules-left   = "xworkspaces";
        modules-center = "date";
        modules-right  = "audio network battery";
      };

      "module/xworkspaces" = {
        type = "internal/bspwm";
        label-focused = "%name%";
        label-focused-padding = 1;
        label-focused-foreground = "#ebbcba";

        label-occupied = "%name%";
        label-occupied-padding = 1;
        label-occupied-foreground = "#e0def4";

        label-urgent = "%name%";
        label-urgent-padding = 1;
        label-urgent-foreground = "#eb6f92";

        label-empty = "%name%";
        label-empty-padding = 1;
        label-empty-foreground = "#908caa";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%H:%M";
        date-alt = "%a %d %b";
        label = "%date%";
        label-foreground = "#f6c177";
      };

      "module/audio" = {
        type = "internal/alsa";
        format-volume = "<label-volume>";
        label-volume = "  %percentage%%";
        label-muted = "  %percentage%%";
        label-volume-foreground = "#9ccfd8";
        label-muted-foreground = "#6e6a86";
      };

      "module/network" = {
        type = "internal/network";
        interface = "wlp1s0";
        interval = 3;
        format-connected = "<label-connected>";
        format-disconnected = "󰤮  offline";
        label-connected = "  %essid%";
        label-connected-foreground = "#31748f";
        label-disconnected-foreground = "#908caa";
      };

      "module/battery" = {
        type = "internal/battery";
        battery = "BAT0";
        adapter = "AC";
        full-at = 98;

        format-charging = "  <label-charging>";
        format-discharging = "  <label-discharging>";
        format-full = "  <label-full>";

        label-charging = "%percentage%%";
        label-discharging = "%percentage%%";
        label-full = "100%";

        label-charging-foreground = "#f6c177";
        label-discharging-foreground = "#ebbcba";
        label-full-foreground = "#9ccfd8";
      };
    };
  };
}

