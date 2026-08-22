{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fd
    age
    age-plugin-yubikey
    python312
    jj
    yubikey-manager
    yubico-piv-tool
    zstd
    openssh
    sioyek
    eza-local 
    short
    texlive.pkgs.latexmk
    texlive.combined.scheme-medium
  ] ++ [
    pkgs.unstable.claude-code
    pkgs.unstable.ffmpeg
    pkgs.unstable.exiftool
    # pkgs.unstable.chromium
  ];
}
