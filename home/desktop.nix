{ pkgs, ... }: {
  imports = [
    ./desktop/hyprland.nix
    ./desktop/waybar.nix
    ./desktop/mako.nix
    ./desktop/theme.nix
  ];
  home.packages = [ pkgs.tailscale ];
}
