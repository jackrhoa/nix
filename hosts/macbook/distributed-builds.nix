{ config, ... }: {
  nix.distributedBuilds = true;
  nix.settings.builders-use-substitutes = true;

  nix.buildMachines = [
    {
      hostName = "nixos-desktop";
      publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUw1WHVaVnJIZ0EzMjNXdjdvZkNrRjJzVGErQUlFMUlUZTBoYUFhWTh4VFMgcm9vdEBuaXhvcwo=";
      sshUser = "remotebuild";
      sshKey = "${config.users.users.jackrhoa.home}/.ssh/nix-builder-nixos";
      protocol = "ssh-ng";
      system = "x86_64-linux";
      supportedFeatures = [ "nixos-test" "big-parallel" "kvm"   ];
    }

  ];



}
