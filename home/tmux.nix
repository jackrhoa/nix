{
  programs.tmux = {
    enable = true;
    # instead of readFile, I'll try to load that config here in nix... eventually
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
