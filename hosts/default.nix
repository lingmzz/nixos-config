{ config, pkgs, username, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./virtualization.nix
    ./boot.nix
    ./networking.nix
    ./user.nix
    ./programs.nix
    ./fonts.nix
    ./pipewire.nix
    ./wine.nix
    ./flatpak.nix
  ];

  # 系统级基础配置
  system.stateVersion = "25.11";

  #Nix 设置
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

 }
