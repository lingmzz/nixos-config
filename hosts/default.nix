{ config, pkgs, username, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./virtualization.nix
    ../modules/core
    ../modules/programs
  ];

  # 系统级基础配置
  system.stateVersion = "25.11";

  # 启用 Niri
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    cava            # 音频可视化
    #libnotify       # 通知
  ];

  programs.dms-shell = {
    enable = true;
    
    # 功能开关
    systemd.enable = true;              # 自动启动服务
    enableSystemMonitoring = true;      # 系统监控 (CPU/RAM/GPU)
    enableVPN = true;                   # VPN 管理
    enableDynamicTheming = true;        # 动态主题 (基于壁纸)
    enableAudioWavelength = true;       # 音频可视化
    enableCalendarEvents = true;        # 日历集成
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";  # Or "hyprland" or "sway"
  };
 }
