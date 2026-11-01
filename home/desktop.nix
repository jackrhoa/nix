{ pkgs, ... }:
let
  taildropReceive = pkgs.writeShellScript "taildrop-receive" ''
    dir="$HOME/Downloads/taildrop"
    mkdir -p "$dir"
    ${pkgs.tailscale}/bin/tailscale file get --loop "$dir" &
    ${pkgs.inotify-tools}/bin/inotifywait -m -q -e moved_to,close_write --format '%f' "$dir" |
      while read -r name; do
        case "$name" in
          *.partial) continue ;;
          *.jpg|*.jpeg|*.JPG|*.JPEG|*.png|*.PNG|*.heic|*.HEIC)
            ${pkgs.imagemagick}/bin/magick "$dir/$name" png:- |
              ${pkgs.wl-clipboard}/bin/wl-copy --type image/png
            ${pkgs.libnotify}/bin/notify-send "Taildrop" "Copied $name to clipboard"
            ;;
          *)
            ${pkgs.libnotify}/bin/notify-send "Taildrop" "Received $name"
            ;;
        esac
      done
  '';
in
{
  my.signingKeyName = "git_key";

  imports = [
    ./desktop/hyprland.nix
    ./desktop/waybar.nix
    ./desktop/hyprlock.nix
    ./desktop/mako.nix
    ./desktop/theme.nix
    ./tmux.nix
  ];
  home.packages = [ pkgs.tailscale ];

  systemd.user.services.taildrop = {
    Unit = {
      Description = "Receive Taildrop files and copy images to the clipboard";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${taildropReceive}";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
