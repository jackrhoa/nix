{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    age
    age-plugin-yubikey
  ];
}
