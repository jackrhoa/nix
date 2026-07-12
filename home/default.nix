{
  home.stateVersion = "26.05";
  imports = [
    ./zsh.nix
    ./fzf.nix
    ./neovim.nix
    ./git.nix
    # ./tmux.nix # desktop has Hyprland
    ./bash.nix
    ./packages.nix
    ./starship.nix
    ./direnv.nix
  ];
}
