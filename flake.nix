{
  description = "glungus";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs, ... }@inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in rec {
    packages.x86_64-linux.glungus = pkgs.callPackage ./default.nix {};
    packages.x86_64-linux.default = packages.x86_64-linux.glungus;
    # defaultPackage.x86_64-linux = packages.x86_64-linux.glungus;

    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        SDL2
        SDL2_ttf
        SDL2_image
        cargo
      ];
      shellHook = "fish && exit";
    };  
  };
}
