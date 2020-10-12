{
  description = "Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-20.09";
    #nixpkgs.url = "github:WilliButz/nixpkgs?ref=codimd/fix-sqlite/node12";
    #nixpkgs.url = "git+https://github.com/WilliButz/nixpkgs?ref=codimd/fix-sqlite/node12";
    #flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs } @ inputs: rec {

    nixosConfigurations."fr-desktop" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ (import ./machines/fr-desktop/default.nix) ];
      specialArgs = { inherit inputs; };
    };

    nixosConfigurations."fr-laptop" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ (import ./machines/fr-laptop/default.nix) ];
      specialArgs = { inherit inputs; };
    };

    #packages.x86_64-linux.defaultPackage = nixosConfigurations."fr-desktop";
  };
}