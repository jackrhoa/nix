{ pkgs, ... }: {
  programs.zsh = {
      enable = true;
      history.share = false;
  };

  programs.zsh.shellAliases = {
    whatismyip = "curl ipinfo.io";
<<<<<<< Updated upstream
     
    ls = "eza --icons=auto";
    ll = "eza -l --icons=auto --git --header";
    la = "eza -la --icons=auto --git";
    lt = "eza --tree --level=2 --icons=auto --ignore-glob 'node_modules'";
||||||| Stash base
     
    ls = "eza --icons";
    ll = "eza -l --icons --git --header";
    la = "eza -la --icons --git";
    lt = "eza --tree --level=2 --icons";
=======
         
    ls = "eza --icons";
    ll = "eza -l --icons --git --header";
    la = "eza -la --icons --git";
    lt = "eza --tree --level=2 --icons";
>>>>>>> Stashed changes
    
    g = "git";
  };

  programs.zsh.shellAliases.nrs = 
    if pkgs.stdenv.isDarwin
    then "sudo darwin-rebuild switch"
    else "sudo nixos-rebuild switch --flake ~/.config/nix#desktop";
}

