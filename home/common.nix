{ config, pkgs, ... }:

{
  # 共享配置
  home.packages = with pkgs; [
    # 基础工具
    #ripgrep
    #fd
    eza
    #bat
    fzf
    #zoxide
    
    # Niri 相关工具
    #wl-clipboard      # 剪贴板支持
    #grimblast         # 截图工具
    #libnotify         # 通知库
  ];
  
  # 启用 XDG 目录规范
  xdg.enable = true;
  
  # 用户目录
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";
  };
}
