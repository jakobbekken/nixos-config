{ ... }:

{
  home.file.aerospace = {
    target = ".aerospace.toml";
    text = ''
      enable-normalization-flatten-containers = false
      enable-normalization-opposite-orientation-for-nested-containers = false

      [gaps]
      inner.horizontal = 16
      inner.vertical   = 16
      outer.left       = 16
      outer.bottom     = 16
      outer.top        = 16
      outer.right      = 16

      [mode.main.binding]
      alt-j = "focus-monitor 1"
      alt-k = "focus-monitor 2"
      alt-l = "focus right"
      alt-h = "focus left"

      alt-shift-j = "move-node-to-monitor 1"
      alt-shift-k = "move-node-to-monitor 2"
      alt-shift-l = "move right"
      alt-shift-h = "move left"

      alt-m = "fullscreen"
      alt-t = "layout floating tiling"

      alt-1 = "workspace 1"
      alt-2 = "workspace 2"
      alt-3 = "workspace 3"
      alt-4 = "workspace 4"
      alt-5 = "workspace 5"
      alt-6 = "workspace 6"

      alt-shift-1 = "move-node-to-workspace 1"
      alt-shift-2 = "move-node-to-workspace 2"
      alt-shift-3 = "move-node-to-workspace 3"
      alt-shift-4 = "move-node-to-workspace 4"
      alt-shift-5 = "move-node-to-workspace 5"

      alt-shift-c = "reload-config"

      alt-enter = 'exec-and-forget open -n "/Applications/Ghostty.app"'

      [workspace-to-monitor-force-assignment]
      1 = "main"
      2 = "main"
      3 = "main"
      4 = ["built-in", "main"]
      5 = ["built-in", "main"]
    '';
  };
}
