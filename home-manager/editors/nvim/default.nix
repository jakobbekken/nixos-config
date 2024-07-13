{ config, pkgs, ... }:

{
  # From: https://www.youtube.com/watch?v=YZAnJ0rwREA

  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      -- Write lua code here
      ${builtins.readFile ./keybinds.lua}
      ${builtins.readFile ./options.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      {
        plugin = catppuccin-nvim;
	      config = "colorscheme catppuccin-mocha";
      }

      {
        plugin = lualine-nvim;
	      config = toLua "require('lualine').setup()";
      }
      
      {
        plugin = nvim-web-devicons;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugins/telescope.lua;
      }

      # {
      #   plugin = ;
      #   config = ;
      # {
    ];
  };
}
