{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    initContent = ''
      export MAMBA_EXE="${pkgs.micromamba}/bin/micromamba"
      export MAMBA_ROOT_PREFIX="$HOME/.micromamba"

      __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
      if [ $? -eq 0 ]; then
        eval "$__mamba_setup"
      else
        alias micromamba="$MAMBA_EXE"
      fi
      unset __mamba_setup
    '';

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

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = {
      hide_env_diff = true;
    };
  };
}
