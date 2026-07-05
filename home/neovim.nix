{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    nil
  ];

  xdg.configFile."nvim".source = ./nvim;
}
