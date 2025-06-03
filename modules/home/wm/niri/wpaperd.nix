{ inputs, ... }:

{
  programs.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = "${inputs.wallpapers.all.Cloud}";
        mode = "center";
      };
      HDMI-A-1 = {
        path = "${inputs.wallpapers.all.Cloud}";
        mode = "center";
      };
    };
  };
}
