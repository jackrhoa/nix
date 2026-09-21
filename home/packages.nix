{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
    typst
    sioyek
    eza-local 
    short
    wireshark
    gws
    google-cloud-sdk
    gh
    dig
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
