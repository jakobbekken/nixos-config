{ ... }:

{
  programs.helix = {
    enable = true;
    ignores = [ 
      ".build/"
      "!.gitignore"
      "!.env"
    ];
    settings = {
      theme = "rose_pine";
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
        }
      ];
    };
  };
}
