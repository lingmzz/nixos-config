{ config, ... }:

{
  services.mako = {
    enable = true;
    
    # 基础设置（颜色由 Stylix 自动设置）
    defaultTimeout = 5000;
    ignoreTimeout = false;
    
    # 布局
    anchor = "top-right";
    width = 300;
    height = 100;
    margin = "10";
    padding = "10";
    
    # 边框（Stylix 会自动匹配）
    borderSize = 2;
    borderRadius = 8;
    
    # 图标
    icons = true;
    maxIconSize = 48;
    
    # 行为
    layer = "overlay";
  };
  
  # 确保目标启用
  stylix.targets.mako.enable = true;
}
