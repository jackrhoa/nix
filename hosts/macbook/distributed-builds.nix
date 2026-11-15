{ config, lib, ... }: {
  nix.distributedBuilds = true;
  nix.settings.builders-use-substitutes = true;

  nix.buildMachines = [
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
