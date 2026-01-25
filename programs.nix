{ config, lib, pkgs, ... }:

{
  programs.firefox.enable = true;

  programs.niri.enable = true;

  programs.npm = {
    enable = true;
    npmrc = ''
      prefix=$HOME/.npm-global;
    '';
  };

  programs.nix-ld.enable = true;

}
