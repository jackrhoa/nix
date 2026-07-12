{ pkgs, ... }: {
  programs.zsh = {
      enable = true;
  };

  programs.zsh.shellAliases = {
    whatismyip = "curl ipinfo.io";
    ls = "eza --icons";
    ll = "eza -l --icons --git --header";
    la = "eza -la --icons --git";
    lt = "eza --tree --level=2 --icons";
  };

  programs.zsh.shellAliases.nrs = 
    if pkgs.stdenv.isDarwin
    then "sudo darwin-rebuild switch"
    else "sudo nixos-rebuild switch --flake ~/.config/nix#desktop";
}

