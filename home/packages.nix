{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fd
    age
    age-plugin-yubikey
    yubikey-manager
    yubico-piv-tool
    zstd
    openssh
    typst
    sioyek
    eza-local 
    short
    wireshark
    hey-cli
    gws
    google-cloud-sdk
    gh
    texlive.pkgs.latexmk
    texlive.combined.scheme-medium
  ] ++ [
    pkgs.unstable.claude-code
    pkgs.unstable.codex
    pkgs.unstable.ffmpeg
    pkgs.unstable.exiftool
    # pkgs.unstable.chromium
  ];
}
