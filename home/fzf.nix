{ pkgs, ... }: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  # programs.zsh.plugins = [
  #   {
  #     name = 
  #   }
  # ];
}
