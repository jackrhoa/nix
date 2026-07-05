{ config, pkgs, ... }: {
  # home.stateVersion = "26.05";
  # programs.zsh = {
  #   enable = true;
  # };
  # we'll give bash own file too
  # programs.bash = {
  #   enable = true; 
  # };
  # home.packages = [
  #   pkgs.fzf
  # ];
  # programs.zsh.initContent = "PROMPT='%m %~ %# '";
  # mac specific
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
  # programs.zsh.shellAliases = {
  #   # ls = "ls --color=auto";
  #   whatismyip = "curl ipinfo.io";
  # };
 # gets own file
  # programs.tmux = {
  #   enable = true;
  #   extraConfig = builtins.readFile ./tmux.conf; 
  # };
  # programs.starship = {
  #   enable = true;
  #   settings = {
  #     # time.disabled = false;
  #     gcloud.disabled = true;
  #     python.disabled = true;
  #     nodejs.disabled = true;
  #     package.disabled = true;
  #   };
  # };
}
