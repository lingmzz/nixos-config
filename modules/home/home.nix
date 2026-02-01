{ config, pkgs, inputs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
  
  imports = [
    ./dev.nix
    ./common.nix
    ./niri
    #./waybar
    #./mako
    ./kitty
    ./fish
    ./vim
    ./yazi
    ./ncmpcpp
    ./fcitx5
  ];
  
  # Home Manager 自动管理自身
  programs.home-manager.enable = true;

  programs.dms-shell = {
    enable = true;
    
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    
    systemd.enable = false;

    enableSystemMonitoring = true;
    enableClipboard = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableVPN = true;
  };

 }
