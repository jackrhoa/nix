{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    age
    age-plugin-yubikey
    python312
  ] ++ [
    pkgs.unstable.claude-code
  ];
}
