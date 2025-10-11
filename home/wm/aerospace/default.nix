{ ... }:

{
  home.file.aerospace = {
    target = ".aerospace.toml";
    text = ''
      enable-normalization-flatten-containers = false
      enable-normalization-opposite-orientation-for-nested-containers = false

      [gaps]
      inner.horizontal = 15
      inner.vertical   = 15
      outer.left       = 15
      outer.bottom     = 15
      outer.top        = 15
      outer.right      = 15

      [mode.main.binding]
      alt-down  = "focus down"
      alt-up    = "focus up"
      alt-right = "focus right"
      alt-left  = "focus left"

      alt-j = "focus down"
      alt-k = "focus up"
      alt-l = "focus right"
      alt-h = "focus left"

      alt-shift-down  = "move down"
      alt-shift-up    = "move up"
      alt-shift-right = "move right"
      alt-shift-left  = "move left"

      alt-shift-j = "move down"
      alt-shift-k = "move up"
      alt-shift-l = "move right"
      alt-shift-h = "move left"

      alt-m = "fullscreen"
      alt-t = "layout floating tiling"

      alt-q = "workspace 1"
      alt-w = "workspace 2"
      alt-f = "workspace 3"
      alt-p = "workspace 4"
      alt-b = "workspace 5"

      alt-shift-q = "move-node-to-workspace 1"
      alt-shift-w = "move-node-to-workspace 2"
      alt-shift-f = "move-node-to-workspace 3"
      alt-shift-p = "move-node-to-workspace 4"
      alt-shift-b = "move-node-to-workspace 5"

      alt-1 = "workspace 1"
      alt-2 = "workspace 2"
      alt-3 = "workspace 3"
      alt-4 = "workspace 4"
      alt-5 = "workspace 5"

      alt-shift-1 = "move-node-to-workspace 1"
      alt-shift-2 = "move-node-to-workspace 2"
      alt-shift-3 = "move-node-to-workspace 3"
      alt-shift-4 = "move-node-to-workspace 4"
      alt-shift-5 = "move-node-to-workspace 5"

      alt-shift-c = "reload-config"

      alt-enter = 'exec-and-forget open -n "/Applications/Alacritty.app"'

      [workspace-to-monitor-force-assignment]
      1 = "main"
      2 = "main"
      3 = "main"
      4 = ["built-in", "secondary", "main"]
      5 = ["built-in", "secondary", "main"]
    '';
  };
}
