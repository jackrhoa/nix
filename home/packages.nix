{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fd
    age
    age-plugin-yubikey
    python312
  ] ++ [
    pkgs.unstable.claude-code
  ];
}
