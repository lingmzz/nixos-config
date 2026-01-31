{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    
    # 交互式 Shell 配置
    interactiveShellInit =
    ''# 启动工具
      ${pkgs.zoxide}/bin/zoxide init fish | source
      ${pkgs.fzf}/bin/fzf --fish | source 
      # 别名
      alias ls 'eza --icons'
      alias ll 'eza -l --icons'
      alias la 'eza -a --icons'
      alias cat 'bat'
    '';
    
    # 插件（通过 Home Manager）
    plugins = [];
    
    # 函数
    functions = {
      fish_greeting = "";  # 禁用问候语
    };
  };
  
  # 启用 Starship 提示符（自动使用 Stylix 颜色）
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      # Starship 会自动适应终端颜色
      format = "$all";
    };
  };
  
  # Stylix 配置 Fish 颜色
  #stylix.targets.fish.enable = true;
}
