{ config, ... }: {
  users.users.remotebuild = {
    isSystemUser = true;
    description = "Nix remote builder";
    group = "remotebuild";
    useDefaultShell = true;

    openssh.authorizedKeys.keyFiles = [ ./remotebuild.pub ];
  };
  users.groups.remotebuild = { };

  nix.settings.trusted-users = [ "remotebuild" ];

  services.openssh = {
    extraConfig = ''
      Match User remotebuild
        AllowAgentForwarding no
        AllowTcpForwarding no
        PermitTTY no
        PermitTunnel no
        X11Forwarding no
        ForceCommand ${config.nix.package}/bin/nix-daemon --stdio
    '';
  };
}

