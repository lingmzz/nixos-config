{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./user.nix
  ];
  
  # Nix 设置
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  
  # 本地化和时区
  time.timeZone = "Asia/Shanghai";  # 修改为您的时区
  i18n.defaultLocale = "zh_CN.UTF-8";
  
  # 键盘
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
