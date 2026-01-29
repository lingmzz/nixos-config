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
    ./modules/fcitx5
  ];
  
  # Home Manager 自动管理自身
  programs.home-manager.enable = true;

  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 24;
    x11.enable = true;   # X11 链接
    gtk.enable = true;   # GTK 链接（修复 Gdk-Message 错误）
  };
}
