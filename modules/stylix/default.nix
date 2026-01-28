{ config, pkgs, ... }:

{
  # 使用 Catppuccin Mocha 配色方案（Base16）
  stylix = {
    enable = true;
    autoEnable = true;  # 自动为支持的应用启用主题
    
    # Catppuccin Mocha 主题方案
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    
    # 壁纸
    # image = ./wallpaper.png;
    # 如果不指定图片，将直接使用 base16Scheme 的颜色
    
    # 字体配置
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
    
    # 字体大小
    fonts.sizes = {
      applications = 12;
      terminal = 12;
      desktop = 10;
      popups = 10;
    };
    
    # 透明度
    opacity = {
      applications = 1.0;
      terminal = 0.95;
      desktop = 0.8;
      popups = 0.9;
    };
    
    # 光标主题
    cursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "Catppuccin-Mocha-Dark-Cursors";
      size = 24;
    };
    
    # 针对特定目标的覆盖（可选）
    targets = {
      # GDM（登录管理器）
      gnome.enable = true;  # GDM 使用 GNOME 目标
      
      # 如果某些程序需要禁用主题
      # firefox.enable = false;
    };
  };
  
  # 确保 base16-schemes 包可用
  environment.systemPackages = [ pkgs.base16-schemes ];
}
