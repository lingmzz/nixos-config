{ config, pkgs, ... }:

{
  xdg.configFile = {
    "fish/config.fish" = {
      source = ./config.fish;
      force = true;
    };
  };
}
