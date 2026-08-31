{ lib, pkgs, config, ... }:
let
  cfg = config.local.chmodBPF;
in
{
  options.local.chmodBPF = {
    enable = lib.mkEnableOption "BPF device permission fixup for packet capture";
    group = lib.mkOption {
      type = lib.types.str;
      default = "admin";
      description = "Group granted read/write access to /dev/bpf*.";
    };
  };

  config = lib.mkIf (cfg.enable && pkgs.stdenv.hostPlatform.isDarwin) {
    launchd.daemons.ChmodBPF = {
      script = ''
        set -e
        if ls /dev/bpf* >/dev/null 2>&1; then
          /usr/bin/chgrp ${cfg.group} /dev/bpf*
          /bin/chmod g+rw /dev/bpf*
        fi
      '';
      serviceConfig = {
        Label = "org.wireshark.ChmodBPF";
        RunAtLoad = true;
        WatchPaths = [ "/dev" ];
        StandardOutPath = "/var/log/ChmodBPF.log";
        StandardErrorPath = "/var/log/ChmodBPF.log";
      };
    };
  };
}
