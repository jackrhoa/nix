{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fd
    age
    age-plugin-yubikey
    jj
    yubikey-manager
    yubico-piv-tool
    zstd
    openssh
    typst
    sioyek
    eza-local 
    short
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
