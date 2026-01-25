{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    swww
  ];
  
  home.file.".config/wallpaper" = {
    source = ./pictures;
    recursive = true;
  };

  home.file.".config/wallpaper/script/swww-rofi.sh" = {
    source = ./swww-rofi.sh;
    executable = true;
    force = true;
  };

}
