{ config, pkgs, inputs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
  
  imports = [
    ./dev.nix
    ./common.nix
    ./niri
    ./waybar
    ./mako
    ./kitty
    ./fish
    ./vim
    ./yazi
    ./ncmpcpp
    ./fcitx5
  ];
  
  # Home Manager 自动管理自身
  programs.home-manager.enable = true;

}
