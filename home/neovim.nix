{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    lua-language-server
  ];
  
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ gitsigns-nvim ];
    extraLuaConfig = builtins.readFile ./nvim/init.lua;
  };

  xdg.configFile."nvim/lsp".source = ./nvim/lsp;

}
