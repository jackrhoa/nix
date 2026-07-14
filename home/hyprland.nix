{ pkgs, lib, ... }: {
  xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;
  xdg.configFile."hypr/monitors.lua".source = ./hypr/monitors.lua;

  home.activation.reloadHyprland = 
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      runtime="/run/user/$UID/hypr"
      if [ -d $runtime ]; then
        sig=$(ls "$runtime" | sort -t_ -k2,2n | tail -1)
        run env \
          XDG_RUNTIME_DIR="/run/user/$UID" \
          HYPRLAND_INSTANCE_SIGNATURE="$sig" \
          ${pkgs.hyprland}/bin/hyprctl reload || true
      fi
    '';
}
