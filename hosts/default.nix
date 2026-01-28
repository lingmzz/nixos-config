{ config, pkgs, username, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/core
    ../modules/stylix      # 主题系统级配置
    ../modules/programs
  ];

  # 系统级基础配置
  system.stateVersion = "25.11";

  # 启用 Niri
  programs.niri.enable = true;

}
