{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mcps = {
      url = "github:roman/mcps.nix";
      # Don't follow our nixpkgs - let mcps use its own version
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, mcps, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      # macOS configuration (nix-darwin + home-manager)
      darwinConfigurations."karolkozakowski" = nix-darwin.lib.darwinSystem {
        inherit system;
        modules = [
          ./darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.karolkozakowski = import ./home.nix;
            home-manager.sharedModules = [
              mcps.homeManagerModules.claude-install
            ];
          }
        ];
      };

      homeConfigurations = {
        # VPS configuration
        "karolkozakowski-vps" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          modules = [
            ./home-vps.nix
            mcps.homeManagerModules.claude-install
          ];
        };
      };
    };
}
