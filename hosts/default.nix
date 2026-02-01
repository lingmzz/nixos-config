{ config, pkgs, username, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./virtualization.nix
    ../modules/core
    ../modules/stylix      # 主题系统级配置
    ../modules/programs
  ];

  # 系统级基础配置
  system.stateVersion = "25.11";

  # 启用 Niri
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [

    brightnessctl   # 亮度控制
    cava            # 音频可视化
    libnotify       # 通知
    grimblast       # 截图工具
  ];

 }
