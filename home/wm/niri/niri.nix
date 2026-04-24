{ config, inputs, ... }:

{
  imports = [
    inputs.niri-flake.homeModules.niri
  ];


  programs.niri = {
    enable = true;

    settings = {
      prefer-no-csd = true;

      input = {
        keyboard.xkb = {
          layout = "us";
          variant = "altgr-intl";
          options = "caps:escape";
        };

        mouse = {
          accel-profile = "flat";
          accel-speed = 0.0;
        };

        focus-follows-mouse.enable = false;
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

      outputs = {
        DP-1 = {
          scale = 1;
          mode = {
            width = 1920;
            height = 1080;
            refresh = 180.003;
          };
          position = {
            x = 0;
            y = 0;
          };
        };
      };

      workspaces = {
        "m1" = {
          open-on-output = "DP-1";
          name = "M1";
        };
        "m2" = {
          open-on-output = "DP-1";
          name = "M2";
        };
        "m3" = {
          open-on-output = "DP-1";
          name = "M3";
        };
        "m4" = {
          open-on-output = "DP-1";
          name = "M4";
        };
        "m5" = {
          open-on-output = "DP-1";
          name = "M5";
        };
        "m6" = {
          open-on-output = "DP-1";
          name = "M6";
        };
        "m7" = {
          open-on-output = "DP-1";
          name = "M7";
        };
        "m8" = {
          open-on-output = "DP-1";
          name = "M8";
        };
      };

      environment = {
        QT_QPA_PLATFORM = "wayland;xcb";
        GDK_BACKEND = "wayland,x11";
        NIXOS_OZONE_WL = "1";
        WLR_DRM_NO_ATOMIC = "1";
        MOZ_ENABLE_WAYLAND = "1";
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_DESKTOP = "niri";
      };

      binds = with config.lib.niri.actions; let
        sh = spawn "sh" "-c";
      in
      {
        "Mod+D".action = spawn "fuzzel";
        "Mod+Return".action = spawn "alacritty";
        "Mod+Q".action = close-window;
        "Mod+Alt+Shift+Q".action = quit;

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

        "Mod+1".action = focus-workspace "M1";
        "Mod+2".action = focus-workspace "M2";
        "Mod+3".action = focus-workspace "M3";
        "Mod+4".action = focus-workspace "M4";
        "Mod+5".action = focus-workspace "M5";
        "Mod+6".action = focus-workspace "M6";
        "Mod+7".action = focus-workspace "M7";
        "Mod+8".action = focus-workspace "M8";

        "Mod+Shift+1".action.move-window-to-workspace = "M1";
        "Mod+Shift+2".action.move-window-to-workspace = "M2";
        "Mod+Shift+3".action.move-window-to-workspace = "M3";
        "Mod+Shift+4".action.move-window-to-workspace = "M4";
        "Mod+Shift+5".action.move-window-to-workspace = "M5";
        "Mod+Shift+6".action.move-window-to-workspace = "M6";
        "Mod+Shift+7".action.move-window-to-workspace = "M7";
        "Mod+Shift+8".action.move-window-to-workspace = "M8";

        "Mod+Ctrl+1".action.move-column-to-workspace = "M1";
        "Mod+Ctrl+2".action.move-column-to-workspace = "M2";
        "Mod+Ctrl+3".action.move-column-to-workspace = "M3";
        "Mod+Ctrl+4".action.move-column-to-workspace = "M4";
        "Mod+Ctrl+5".action.move-column-to-workspace = "M5";
        "Mod+Ctrl+6".action.move-column-to-workspace = "M6";
        "Mod+Ctrl+7".action.move-column-to-workspace = "M7";
        "Mod+Ctrl+8".action.move-column-to-workspace = "M8";

      };
    };
  };
}
