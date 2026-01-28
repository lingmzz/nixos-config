{ config, pkgs, inputs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
  
  imports = [
    # Niri Home Manager 模块（提供 programs.niri.settings）
    inputs.niri.homeModules.niri
    # Niri 的 Stylix 集成模块
    inputs.niri.homeModules.stylix
    
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
