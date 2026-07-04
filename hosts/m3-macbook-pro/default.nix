{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.nil
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  users.users.jackrhoa.home = "/Users/jackrhoa";

  # Use TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;
  security.pam.services.sudo_local.reattach = true;

  # Enable tailscale CLI
  environment.shellAliases.tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
}
