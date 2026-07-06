{
  description = "Jack's nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
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
      ./home # auto imorts default.nix
	    ./home/macbook.nix
	  ];
	}
      ];
    };
  };
}
