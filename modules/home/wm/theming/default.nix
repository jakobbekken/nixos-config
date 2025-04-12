{ pkgs, ... }:

{
  home.packages = with pkgs; [
    capitaine-cursors
    rose-pine-gtk-theme
    lxappearance
    dconf
  ];

  home.pointerCursor = {
    name = "capitaine-cursors";
    package = pkgs.capitaine-cursors;
    gtk.enable = true;
    x11.enable = true;
    size = 32;
  };

  gtk = {
    enable = true;
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    cursorTheme = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors;
      size = 32;
    };
  };

  home.sessionVariables = {
    XCURSOR_THEME = "capitaine-cursors";
    XCURSOR_SIZE = "32";
    GTK_THEME = "rose-pine";
  };
}
