{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    # 基础设置（颜色由 Stylix 处理）
    settings = {
      # 字体（Stylix 会自动设置，但可覆盖）
      # font_family = config.stylix.fonts.monospace.name;
      # font_size = config.stylix.fonts.sizes.terminal;
      
      # 行为
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      
      # 窗口
      window_padding_width = 4;
      confirm_os_window_close = 0;
      
      # 透明背景（如需要）
      # background_opacity = "0.95";
    };
    
    # Shell 集成
    shellIntegration = {
      enableFishIntegration = true;
      mode = "no-cursor";
    };
  };
  
}
