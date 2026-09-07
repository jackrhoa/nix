{ pkgs, ... }: {
  imports = [
    ./desktop/hyprland.nix
    ./desktop/waybar.nix
    ./desktop/hyprlock.nix
    ./desktop/mako.nix
    ./desktop/theme.nix
    ./tmux.nix
  ];
  home.packages = [ pkgs.tailscale ];
}
