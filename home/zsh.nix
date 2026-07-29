{ pkgs, ... }: {
  programs.zsh = {
      enable = true;
  };

  programs.zsh.shellAliases = {
    whatismyip = "curl ipinfo.io";
     
    ls = "eza --icons=auto";
    ll = "eza -l --icons=auto --git --header";
    la = "eza -la --icons=auto --git";
    lt = "eza --tree --level=2 --icons=auto --ignore-glob 'node_modules'";
    
    g = "git";
  };

  programs.zsh.shellAliases.nrs = 
    if pkgs.stdenv.isDarwin
    then "sudo darwin-rebuild switch"
    else "sudo nixos-rebuild switch --flake ~/.config/nix#desktop";
}

