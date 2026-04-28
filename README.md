# nixpkgs fails on C++20 with CMake 4.0

Minimal reproduction of a build failure when using `cmake_minimum_required(VERSION 4.0)` with `target_compile_features` in nixpkgs.

## Build

```sh
nix build .
```
