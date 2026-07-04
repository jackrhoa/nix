{
  description = "M3 MacBook Pro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager }: {
    darwinConfigurations."M3-MacBook-Pro1" = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/macbook
	home-manager.darwinModules.home-manager
	{
    home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.backupFileExtension = "hm-bak";
	  home-manager.users.jackrhoa.imports = [
  	  ./home/common.nix
	    ./home/macbook.nix
      ./home/starship.nix
	  ];
	  # home-manager.users.jackrhoa = { pkgs, ... }: {
	    # home.stateVersion = "26.05";
	    # home.packages = [
	    #   pkgs.ghostty-bin
	    # ];
	    # programs.zsh = {
	    #   enable = true;
	    #   initContent = builtins.readFile ./zshrc;
	    # };
	    # more programs / dot files here? Or not
          # };
	}
      ];
    };
  };
}
