{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_24
    ripgrep
    maven
    jupyter
    fd
    age
    age-plugin-yubikey
    yubikey-manager
    yubico-piv-tool
    zstd
    openssh
    eza-local 
    short
    wireshark
    gws
    google-cloud-sdk
    gh
    dig
    git-filter-repo
    aws-vault
    terraform
    awscli2
    ssm-session-manager-plugin # required for awscli2
  ] ++ [
    pkgs.unstable.claude-code
    pkgs.unstable.codex
    pkgs.unstable.ffmpeg
    pkgs.unstable.exiftool
    # pkgs.unstable.chromium
  ];
}
