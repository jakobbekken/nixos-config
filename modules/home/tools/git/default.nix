{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Jakob Moen Bekken";
    userEmail = "jakobmb@uia.no";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
