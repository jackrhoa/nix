{ ... }: {
  home.stateVersion = "26.05";
  programs.zsh = {
    enable = true;
  };
  programs.zsh.shellAliases = {
    ls = "ls --color=auto";
    whatismyip = "curl ipinfo.io";
  };
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux.conf; 
  };
}
