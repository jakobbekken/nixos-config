{ inputs, ... }:

{
  programs.wpaperd = {
    enable = true;
    settings = {
      DP-1 = {
        path = "${inputs.wallpapers.all.Cloud}";
        mode = "center";
      };
    };
  };
}
