{
  description = "Home Manager configuration of jank";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    mkHome = { system, username, homeDirectory, extraModules ? [] }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./modules/common.nix
          { 
            home.username = username;
            home.homeDirectory = homeDirectory;
          }
        ] ++ extraModules;
        extraSpecialArgs = { inherit username homeDirectory; };
      };
  in {
    homeConfigurations = {

      "jank@archdesktop" = mkHome {
        system = "x86_64-linux";
        username = "jank";
        homeDirectory = "/home/jank";
        extraModules = [ ./modules/linux.nix ];
      };

      "jan.kulka@workmac" = mkHome {
        system = "aarch64-darwin";
        username = "jan.kulka";
        homeDirectory = "/Users/jan.kulka";
        extraModules = [ ./modules/darwin.nix ];
      };

      "jank@cybertop" = mkHome {
        system = "x86_64-linux";
        username = "jank";
        homeDirectory = "/home/jank";
        extraModules = [ ./modules/linux.nix ];
      };
    };
  };
}
