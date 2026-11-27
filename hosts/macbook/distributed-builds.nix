{ config, lib, ... }: {
  determinateNix.distributedBuilds = true;
  determinateNix.customSettings.builders-use-substitutes = true;

  determinateNix.buildMachines = [
    {
      hostName = "nixos-desktop";
      publicHostKey = lib.fileContents ../desktop/publicHostKey;
      sshUser = "remotebuild";
      sshKey = "${config.users.users.jackrhoa.home}/.ssh/nix-builder-nixos";
      protocol = "ssh-ng";
      system = "x86_64-linux";
      supportedFeatures = [ "nixos-test" "big-parallel" "kvm"   ];
    }

  ];



}
