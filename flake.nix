{
  description = "Minimal C++20 build";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "hello-cxx20";
        src = ./.;
        nativeBuildInputs = [
          pkgs.cmake
          pkgs.ninja
        ];
      };
    };
}
