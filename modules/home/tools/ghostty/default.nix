{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "rose-pine";
      font-size = 16;
      window-decoration = "none";
      keybind = [
        "ctrl+backspace=text:\\x17"
      ];
    };
  };
}
