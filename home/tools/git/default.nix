{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Jakob Moen Bekken";
      user.email = "jakobmb@uia.no";
      init.defaultBranch = "master";
    };
  };
}
