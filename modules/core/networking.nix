{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  
  # 使用 NetworkManager（图形环境标准）
  networking.networkmanager.enable = true;
  
  # 禁用默认 dhcpcd（由 NetworkManager 接管）
  networking.useDHCP = false;
  
  # 网络时间与 DNS
  networking.timeServers = [ "ntp.aliyun.com" "time.google.com" ];
  
  # 防火墙
  #networking.firewall = {
  #  enable = true;
  #  
  #  # 允许 SSH（如需要远程访问）
  #  allowedTCPPorts = [ 22 ];
  #};

  # 网络工具
  environment.systemPackages = with pkgs; [
  ];

  networking.proxy = {
    default = "http://127.0.0.1:7890";
    httpProxy = "http://127.0.0.1:7890";
    httpsProxy = "http://127.0.0.1:7890";
    noProxy = "localhost,127.0.0.1,::1,*.local";
  };
}
