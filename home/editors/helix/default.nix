{ ... }:

{
  xdg.configFile."helix/themes/rose_pine_transparent.toml".text = ''
    inherits = "rose_pine"

    "ui.background" = {}
    "ui.cursorline.primary" = { bg = "#26233a" }
  '';

  programs.helix = {
    enable = true;
    ignores = [
      ".build/"
      "!.gitignore"
      "!.env"
    ];
    settings = {
      theme = "rose_pine_transparent";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        cursorline = true;
        color-modes = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
      keys.normal = {
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          formatter.command = "nixpkgs-fmt";
          auto-format = true;
        }
        {
          name = "go";
          auto-format = true;
          formatter = {
            command = "goimports";
          };
        }
      ];
    };
  };
}
