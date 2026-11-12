{
  description = "Home Manager configuration of jank";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-opencode.url = "github:NixOS/nixpkgs/436e34e0bb929ffed9857ad34d74254ad5101d17";
  };

  outputs = { nixpkgs, home-manager, nixpkgs-opencode, ... }:
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
        extraSpecialArgs = { 
            inherit username homeDirectory;
            opencodePkgs = import nixpkgs-opencode { system = "aarch64-darwin"; };
      };};
  in {
    homeConfigurations = {

      "jank@archdesktop" = mkHome {
        system = "x86_64-linux";
        username = "jank";
        homeDirectory = "/home/jank";
        extraModules = [ ./modules/linux.nix ./modules/personal.nix ];
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
