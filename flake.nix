{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mcps = {
      url = "github:roman/mcps.nix";
      # Don't follow our nixpkgs - let mcps use its own version
    };
  };

  outputs = { self, nixpkgs, home-manager, mcps, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      homeConfigurations = {
        # macOS configuration
        "karolkozakowski" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home.nix
            mcps.homeManagerModules.claude-install
          ];
        };

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
