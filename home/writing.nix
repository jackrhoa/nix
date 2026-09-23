{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pandoc
    typst
    texlive.pkgs.latexmk
    texlive.combined.scheme-medium
  ];
}
