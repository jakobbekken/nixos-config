{ ... }:

{
  services.polybar = {
    enable = true;
    script = "";
    settings = {
      "bar/main" = {
        monitor = "eDP";
        width = "100%";
        height = "32px";

        padding = 1;

        
        background = "#191724";
        foreground = "#e0def4";

        font = [
          "FiraCode Nerd Font:pixelsize=14;2"
        ];

        acitve-font = 0;

        wm.restack = "bspwm";

        modules.left = "date";
        modules.center = "xworkspaces";
        modules.right = "battery";
      };

      "bar/monitor" = {
        monitor = "HDMI-A-0";
        width = "100%";
        height = "32px";

        padding = 1;

        
        background = "#191724";
        foreground = "#e0def4";

        font = [
          "FiraCode Nerd Font:pixelsize=14;2"
        ];

        acitve-font = 0;

        wm.restack = "bspwm";

        modules.left = "date";
        modules.center = "xworkspaces";
        modules.right = "battery";
      };

      "module/xworkspaces" = {
        type = "internal/bspwm";
        label.active.text = "%name%";
        label.active.padding = 1;
        label.active.foreground = "#ebbcba";
        label.occupied.text = "%name%";
        label.occupied.padding = 1;
        label.occupied.foreground = "#e0def4";
        label.urgent.text = "%name%";
        label.urgent.padding = 1;
        label.urgent.foreground = "#eb6f92";
        label.empty.text = "%name%";
        label.empty.padding = 1;
        label.empty.foreground = "#908caa";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%H:%M";
        date-alt = "%d/%m/%y";
        label = "%date%";
      };

      "module/battery" = {
        type = "internal/battery";
        full.at = 99;
        low.at = 10;
        battery = "BAT0";
        adapter = "AC";
        poll-interval = 5;
      };
    };
  };
}
