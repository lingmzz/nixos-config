{ config, pkgs, ... }:

{
  # 共享配置
  home.packages = with pkgs; [
    # 基础工具
    #ripgrep
    #fd
    eza
    jq
    fzf
    btop
    tree
    obsidian

    imv
    mpv
    
    # Niri 相关工具
    #wl-clipboard      # 剪贴板支持
    #grimblast         # 截图工具
    #libnotify         # 通知库
  ];

  programs.fastfetch = {
    enable = true;
  };
  
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

  xdg.mimeApps = {
    enable = true;
    
    # 默认应用程序映射
    defaultApplications = {
      # 网页浏览器
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
      
      # 图片查看器（使用 imv 或自选的 GUI 查看器）
      "image/png" = "imv.desktop";
      "image/jpeg" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/svg+xml" = "firefox.desktop";
      
      # 视频播放器（MPV）
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/avi" = "mpv.desktop";
      "video/mpeg" = "mpv.desktop";
      
      "application/pdf" = "firefox.desktop";
      
      # 音频文件（MPD/ncmpcpp 或 MPV）
      "audio/mpeg" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";
    };
    # 为特定 MIME 类型添加额外关联（不替换默认）
    associations.added = {
      "text/plain" = [ "kitty.desktop" "firefox.desktop" ];
    };
  };
}
