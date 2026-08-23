{ pkgs, ... }: {
  services.tailscale.enable = !pkgs.stdenv.hostPlatform.isDarwin;
}
