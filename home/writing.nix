{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pandoc
    typst
    tdf
    texlive.pkgs.latexmk
    texlive.combined.scheme-medium
  ];
}
