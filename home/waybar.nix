{ pkgs, ... }:
let
  razerBattery = pkgs.writeShellScript "razer-battery" ''
    dbus="${pkgs.dbus}/bin/dbus-send"
    serials=$($dbus --session --print-reply --dest=org.razer \
      /org/razer razer.devices.getDevices 2>/dev/null | grep -oP '(?<=string ")[^"]+')
    text="" tip=""
    for s in $serials; do
      p=/org/razer/device/$s
      bat=$($dbus --session --print-reply --dest=org.razer $p \
        razer.device.power.getBattery 2>/dev/null | grep -oP '(?<=double )[0-9.]+')
      [ -z "$bat" ] && continue          # device has no battery interface
      name=$($dbus --session --print-reply --dest=org.razer $p \
        razer.device.misc.getDeviceName 2>/dev/null | grep -oP '(?<=string ")[^"]+')
      chg=$($dbus --session --print-reply --dest=org.razer $p \
        razer.device.power.isCharging 2>/dev/null | grep -oP '(?<=boolean )\w+')
      bat=''${bat%.*}
      case "$name" in
        *Cobra*|*Viper*|*DeathAdder*|*Basilisk*|*Mouse*) icon="󰍽" ;;
        *BlackWidow*|*Huntsman*|*Keyboard*)              icon="󰌌" ;;
        *)                                               icon="" ;;
      esac
      [ "$chg" = "true" ] && icon="󰄄"
      sep=""; [ -n "$text" ] && sep="  "
      text="$text$sep$icon $bat%"
      charge=""; [ "$chg" = "true" ] && charge=" (charging)"
      nl=""; [ -n "$tip" ] && nl="\n"
      tip="$tip$nl$name: $bat%$charge"
    done
    [ -z "$text" ] && text="󰭎 —"
    printf '{"text":"%s","tooltip":"%s","class":"razer"}\n' "$text" "$tip"
  '';
in {
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "custom/razer" "pulseaudio" "network" "tray" ];

      "custom/razer" = {
        exec = "${razerBattery}";
        return-type = "json";
        interval = 30;
        tooltip = true;
      };
      clock.format = "{:%a %d %b  %H:%M}";
      network = {
        format-wifi = "  {essid}";
        format-ethernet = "󰈀 ";
        format-disconnected = "󰤭 ";
      };
      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "󰝟 ";
        format-icons.default = [ "󰕿" "󰖀" "󰕾" ];
      };
      tray.spacing = 8;
    };
    style = ''
      * { font-family: "JetBrainsMono Nerd Font", sans-serif; font-size: 13px; }
      window#waybar { background: rgba(30,30,46,0.9); color: #cdd6f4; }
      #workspaces button { padding: 0 8px; color: #cdd6f4; }
      #workspaces button.active { background: #45475a; }
      #custom-razer, #pulseaudio, #network, #clock, #tray { padding: 0 10px; }
    '';
  };
}
