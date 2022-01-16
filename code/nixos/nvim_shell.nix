{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    pkgs."nodejs-14_x"
    pkgs.yarn
    pkgs.rust-analyzer
    pkgs.rust-bin.stable."1.54.0".default
    pkgs.rust-bin.stable."1.54.0".rust-src
    pkgs.buildah-unwrapped 
  ];
}
