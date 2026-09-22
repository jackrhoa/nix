{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pandoc
    typst
    sioyek
    texlive.pkgs.latexmk
    texlive.combined.scheme-medium
  ];
}
