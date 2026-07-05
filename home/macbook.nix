{ pkgs, config, ... }: {
  # imports = [ ./starship.nix ];
  home.stateVersion = "26.05";
  home.packages = [
    pkgs.ghostty-bin
  ];
  programs.zsh = {
    enable = true;
    initContent = builtins.readFile ./zshrc;
  };
  programs.zsh.shellAliases = {
    tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
    vim = "ECHO 'no. use NVIM'";
    
    # alias for decrypting files using age and Yubikey 1
    # takes 2 arg: file to decrypt and decrypted output file
    # outputs decrupted output file 
    ykd = "$HOME/LocalDocuments/scripts/age-plugin-yk-decrypt.sh";

    # alias for encrypting files using age and Yubikey 1
    # takes 1 arg: file to encrypt
    # output: file.age (encrypted version)
    yke = "$HOME/LocalDocuments/scripts/age-plugin-yk-encrypt.sh";
  };
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
  # home.sessionPath = {
  #
  # };
  # home.sessionVariables = {
  #
  # };
  #

}
