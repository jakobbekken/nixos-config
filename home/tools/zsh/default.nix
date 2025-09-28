{ ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "bira";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
