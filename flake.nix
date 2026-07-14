{
  description = "Jack's nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-darwin, home-manager }:
    let
      hmConfig = user: hostModule: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "hm-bak";
        home-manager.users.${user}.imports = [
          ./home
          hostModule
        ];
      };
      unstableOverlay = {
        nixpkgs.overlays = [
          (final: prev: {
            unstable = import nixpkgs-unstable {
              system = prev.stdenv.hostPlatform.system;
              config.allowUnfree = true;
            };

          })
        ];
      };

    in
    {
      darwinConfigurations."M3-MacBook-Pro1" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/macbook
          home-manager.darwinModules.home-manager
          (hmConfig "jackrhoa" ./home/macbook.nix)
          unstableOverlay
        ];
      };

      nixosConfigurations."desktop" = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/desktop
          home-manager.nixosModules.home-manager
          (hmConfig "jack" ./home/desktop.nix)
          unstableOverlay
        ];
      };
    };
}
