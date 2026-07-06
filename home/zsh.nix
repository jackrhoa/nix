{ pkgs, ... }: {
  programs.zsh = {
      enable = true;
  };

  programs.zsh.shellAliases = {
    # ls = "ls --color=auto";
    whatismyip = "curl ipinfo.io";

  };

  programs.zsh.shellAliases.nrs = 
    if pkgs.stdenv.isDarwin
    then "sudo darwin-rebuild switch"
    else "sudo nixos-rebuild switch --flake ~/.config/nix#desktop";
}

