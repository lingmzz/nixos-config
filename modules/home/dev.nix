{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea
    jetbrains.datagrip

    javaPackages.compiler.openjdk8
    python3
  ];

}
