{ config, pkgs, ... }:

{
  xdg.configFile = {
    "kitty/themes" = {
      source = ./themes;
      force = true;
      recursive = true;
    };
    "kitty/kitty.conf" = {
      source = ./kitty.conf;
      force = true;
    };
  };
}
