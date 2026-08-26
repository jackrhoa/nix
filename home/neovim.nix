{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    lua-language-server
    vtsls
    tinymist
  ];
  
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ gitsigns-nvim ];
    initLua = builtins.readFile ./nvim/init.lua;
    defaultEditor = true;
  };

  xdg.configFile."nvim/lsp".source = ./nvim/lsp;

}
