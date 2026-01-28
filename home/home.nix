{ config, pkgs, inputs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
  
  imports = [
    ./dev.nix
    ./common.nix
    ./modules/niri
    ./modules/waybar
    ./modules/mako
    ./modules/kitty
    ./modules/fish
    ./modules/vim
    ./modules/yazi
    ./modules/ncmpcpp
  ];
  
  # Home Manager 自动管理自身
  programs.home-manager.enable = true;
}
