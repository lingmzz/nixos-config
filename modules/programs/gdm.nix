{ config, pkgs, ... }:

{
  # GDM 配置（Stylix 会自动主题化）
  services.displayManager.gdm = {
    enable = true;
    wayland = true;  # 使用 Wayland 会话
  };
  
  services.desktopManager.gnome.enable = true;  # 需要 GNOME 基础支持 GDM
  
  # Stylix 会自动处理 GDM 主题（通过 targets.gnome）
}
