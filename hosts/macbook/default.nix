{ lib, ... }: {
  imports = [
    ../../modules/chmod-bpf.nix
    ../../modules/maccy.nix
    ../../modules/scroll-reverser.nix
    ./distributed-builds.nix
    # Mac apps installed at system level
    ./brew.nix
  ];

  local.chmodBPF.enable = true;

  nix.linux-builder = {
    enable = false;
    config.virtualisation = {
      cores = lib.mkForce 4;
      memorySize = lib.mkForce 8192;
    };
  };

  # nix.buildMachines = {
  #
  # }

  # environment.systemPackages = [];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  system.primaryUser = "jackrhoa";
  users.users.jackrhoa.home = "/Users/jackrhoa";

  # Use TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;
  security.pam.services.sudo_local.reattach = true;

  # Enable tailscale CLI
  environment.shellAliases.tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
}
