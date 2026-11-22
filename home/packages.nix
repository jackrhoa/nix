{ pkgs, ... }:
{
  home.packages = with pkgs; [
    colima
    docker
    docker-compose
    docker-buildx
    nodejs_24
    python3
    pnpm
    ripgrep
    maven
    fd
    age
    age-plugin-yubikey
    yubikey-manager
    yubico-piv-tool
    zstd
    unzip
    openssh
    eza-local 
    short
    wireshark
    gws
    google-cloud-sdk
    gh
    dig
    git-filter-repo
    awscli2
    ssm-session-manager-plugin # required for awscli2
  ] ++ [
    pkgs.unstable.vscode
    pkgs.unstable.terraform
    pkgs.unstable.codex
    pkgs.unstable.ffmpeg
    pkgs.unstable.exiftool
    # pkgs.unstable.chromium
  ];
}
