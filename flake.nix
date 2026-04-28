{
  description = "Minimal C++20 build";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-linux"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.llvmPackages.libcxxStdenv.mkDerivation {
            name = "hello-cxx20";
            src = ./.;
            nativeBuildInputs = [
              pkgs.cmake
              pkgs.ninja
            ];
          };
        });
    };
}
