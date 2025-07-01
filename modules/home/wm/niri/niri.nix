{ config, inputs, ... }:

{
  imports = [
    inputs.niri-flake.homeModules.niri
  ];

  programs.niri = {
    enable = true;

    settings = {
      input = {
        keyboard.xkb = {
          layout = "us";
          variant = "altgr-intl";
          options = "caps:escape";
        };
        touchpad = {
          tap = true;
          natural-scroll = true;
          accel-profile = "flat";
          accel-speed = 0.0;
          scroll-factor = 0.75;
        };
        mouse = {
          accel-profile = "flat";
          accel-speed = 0.0;
        };

        focus-follows-mouse.enable = true;
      };

      cursor = {
        size = 24;
        theme = "capitaine-cursors";
        hide-after-inactive-ms = 5000;
        hide-when-typing = true;
      };

      layout = {
        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];
        default-column-width = { proportion = 1. / 2.; };
        always-center-single-column = true;

        focus-ring = {
          active = { color = "#c4a7e7"; };
          inactive = { color = "#00000000"; };
        };

        insert-hint.display = { color = "#c4a7e7"; };

        shadow.enable = true;
      };

      workspaces = {
        "l4" = {
          open-on-output = "eDP-1";
          name = "L4";
        };
        "l3" = {
          open-on-output = "eDP-1";
          name = "L3";
        };
        "l2" = {
          open-on-output = "eDP-1";
          name = "L2";
        };
        "l1" = {
          open-on-output = "eDP-1";
          name = "L1";
        };

        "m4" = {
          open-on-output = "HDMI-A-1";
          name = "M4";
        };
        "m3" = {
          open-on-output = "HDMI-A-1";
          name = "M3";
        };
        "m2" = {
          open-on-output = "HDMI-A-1";
          name = "M2";
        };
        "m1" = {
          open-on-output = "HDMI-A-1";
          name = "M1";
        };
      };
      
      prefer-no-csd = true;
      outputs = {
        eDP-1 = {
          scale = 1;
          mode = {
            width = 1920;
            height = 1200;
            refresh = 60.000;
          };
          position = {
            x = -760;
            y = 1440;
          };
        };
        HDMI-A-1 = {
          scale = 1.25;
          mode = {
            width = 3440;
            height = 1440;
            refresh = 100.0;
          };
          position = {
            x = 0;
            y = 0;
          };
        };
        
      };
      
      environment = {
        QT_QPA_PLATFORM = "wayland;xcb";
        GDK_BACKEND = "wayland,x11";
        NIXOS_OZONE_WL = "1";
        DISPLAY = ":0";
        MOZ_ENABLE_WAYLAND = "1";
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_DESKTOP = "niri";
      };
      spawn-at-startup = [
        { command = [ "xwayland-satellite" ]; }
        { command = [ "mako" ]; }
        { command = [ "wpaperd" ]; }
      ];
      binds = with config.lib.niri.actions; let
        sh = spawn "sh" "-c";
        toggleWaybar = ''
          if [ -f /tmp/waybar_hidden ]; then
            waybar & disown
            rm /tmp/waybar_hidden
          else
            pkill waybar
            touch /tmp/waybar_hidden
          fi
        '';
      in {
        "Mod+D".action = spawn "fuzzel";
        "Mod+Return".action = spawn "alacritty";
        "Mod+Q".action = close-window;
        "Mod+Alt+Shift+Q".action = quit;

        "Mod+B".action = sh toggleWaybar;

        "Mod+R".action = switch-preset-column-width;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+Shift+Home".action = move-column-to-first;
        "Mod+Shift+End".action = move-column-to-last;

        "Mod+F".action = maximize-column;
        "Mod+Ctrl+F".action = fullscreen-window;
        "Mod+C".action = center-column;

        "Mod+Comma".action = consume-or-expel-window-left;
        "Mod+Period".action = consume-or-expel-window-right;

        "Mod+Shift+S".action = sh ''grim -g "$(slurp)" - | wl-copy'';

        "XF86AudioLowerVolume".action = sh ''wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-'';
        "XF86AudioRaiseVolume".action = sh ''wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+'';

        "XF86AudioMute".action = sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86MonBrightnessDown".action = sh ''brightnessctl -q set 2%-'';
        "XF86MonBrightnessUp".action = sh ''brightnessctl -q set 2%+'';

        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-or-workspace-down;
        "Mod+K".action = focus-window-or-workspace-up;
        "Mod+L".action = focus-column-right;

        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
        "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
        "Mod+Shift+L".action = move-column-right;

        "Mod+Alt+H".action.set-column-width = "-10%";
        "Mod+Alt+J".action.set-window-height = "-10%";
        "Mod+Alt+K".action.set-window-height = "+10%";
        "Mod+Alt+L".action.set-column-width = "+10%";

        "Mod+WheelScrollDown".action = focus-workspace-down;
        "Mod+WheelScrollUp".action = focus-workspace-up;

        "Mod+U".action = focus-monitor-down;
        "Mod+I".action = focus-monitor-up;

        "Mod+Shift+U".action = move-window-to-monitor-down;
        "Mod+Shift+I".action = move-window-to-monitor-up;

        "Mod+Shift+Slash".action = show-hotkey-overlay;

        "Mod+1".action = focus-workspace "L1";
        "Mod+2".action = focus-workspace "L2";
        "Mod+3".action = focus-workspace "L3";
        "Mod+4".action = focus-workspace "L4";
        "Mod+5".action = focus-workspace "M1";
        "Mod+6".action = focus-workspace "M2";
        "Mod+7".action = focus-workspace "M3";
        "Mod+8".action = focus-workspace "M4";

        "Mod+Shift+1".action.move-window-to-workspace = "L1";
        "Mod+Shift+2".action.move-window-to-workspace = "L2";
        "Mod+Shift+3".action.move-window-to-workspace = "L3";
        "Mod+Shift+4".action.move-window-to-workspace = "L4";
        "Mod+Shift+5".action.move-window-to-workspace = "M1";
        "Mod+Shift+6".action.move-window-to-workspace = "M2";
        "Mod+Shift+7".action.move-window-to-workspace = "M3";
        "Mod+Shift+8".action.move-window-to-workspace = "M4";
        
        "Mod+Ctrl+1".action.move-column-to-workspace = "L1";
        "Mod+Ctrl+2".action.move-column-to-workspace = "L2";
        "Mod+Ctrl+3".action.move-column-to-workspace = "L3";
        "Mod+Ctrl+4".action.move-column-to-workspace = "L4";
        "Mod+Ctrl+5".action.move-column-to-workspace = "M1";
        "Mod+Ctrl+6".action.move-column-to-workspace = "M2";
        "Mod+Ctrl+7".action.move-column-to-workspace = "M3";
        "Mod+Ctrl+8".action.move-column-to-workspace = "M4";

      };
    };
  };
}
