{ pkgs, ... }: {

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
  };

}
