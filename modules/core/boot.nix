{ config, pkgs, ... }:

{
  boot.loader.systemd-boot = {
    enable = true;
    # 保留的启动条目数
    configurationLimit = 15;
    # 控制台模式（keep/auto/max/resolution）
    consoleMode = "keep";
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  #boot.kernelPackages = pkgs.linuxPackages_latest;
  
  # 内核模块
  boot.kernelModules = [ "kvm-amd" ];  # 虚拟机支持
}
