{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    nil
    lua-language-server
  ];

  xdg.configFile."nvim".source = ./nvim;
}
