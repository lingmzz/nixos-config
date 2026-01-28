{ config, lib, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    
    # 使用结构化配置（KDL 会自动生成）
    settings = {
      # 输入配置
      input = {
        keyboard.xkb.layout = "us";
        touchpad.tap = true;
        mouse.accel-speed = 0.0;
      };
      
      # 输出配置（根据显示器调整）
      outputs."HDMI-A-1" = {
        mode = "2560x1440@60"
        scale = 1.2;
        # transform = "normal";
      };
      
      # 布局配置
      layout = {
        gaps = 8;
        # 边框宽度（Stylix 会自动设置边框颜色）
        border.width = 2;
        
        #  focus-ring 由 Stylix 管理
        focus-ring.enable = false;  # 使用边框指示焦点
        
        # 阴影
        shadow = {
          enable = true;
          # 颜色由 Stylix 管理
        };
      };
      
      # Spawn-at-startup 程序
      spawn-at-startup = [
        { command = [ "${pkgs.mako}/bin/mako" ]; }
        { command = [ "${pkgs.waybar}/bin/waybar" ]; }
        # 可选：设置壁纸
        # { command = [ "${pkgs.swaybg}/bin/swaybg" "-i" "${config.stylix.image}" "-m" "fill" ]; }
      ];
      
      # 环境变量（自动应用到所有子进程）
      environment = {
        QT_QPA_PLATFORM = "wayland";
        SDL_VIDEODRIVER = "wayland";
        _JAVA_AWT_WM_NONREPARENTING = "1";
        MOZ_ENABLE_WAYLAND = "1";
      };
      
      # 快捷键（推荐）
      binds = with config.lib.niri.actions; {
        # 程序启动
        "Mod+Return".action = spawn "${pkgs.kitty}/bin/kitty";
        "Mod+D".action = spawn "${pkgs.fuzzel}/bin/fuzzel";  # 或 wofi、anyrun
        
        # 窗口管理
        "Mod+Q".action = close-window;
        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Up".action = focus-window-up;
        "Mod+Down".action = focus-window-down;
        
        # 窗口移动
        "Mod+Shift+Left".action = move-column-left;
        "Mod+Switch+Right".action = move-column-right;
        
        # 工作区
        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+Shift+1".action = move-column-to-workspace 1;
        
        # 窗口模式
        "Mod+F".action = fullscreen-window;
        "Mod+Shift+Space".action = float-window;
        
        # 系统
        "Mod+Shift+E".action = quit;
        "Mod+Shift+Slash".action = show-hotkey-overlay;
        
        # 截图（使用 grimblast）
        "Print".action = spawn "${pkgs.grimblast}/bin/grimblast" "copy" "screen";
        "Ctrl+Print".action = spawn "${pkgs.grimblast}/bin/grimblast" "save" "screen" "~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png";
      };
      
      # 窗口规则
      window-rules = [
        {
          matches = [ { app-id = "^kitty$"; } ];
          default-column-width.proportion = 0.5;
        }
        {
          matches = [ { app-id = "^firefox$"; } ];
          default-column-width.proportion = 0.7;
        }
      ];
    };
    
    # 确保 Stylix 目标启用（通常 autoEnable 已处理）
    stylix.targets.niri.enable = true;
  };
  
  # Niri 需要的服务
  #services.swayidle.enable = true;  # 锁屏/休眠（可选）
}
