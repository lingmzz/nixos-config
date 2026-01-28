{ config, ... }:

{
  services.mako = {
    enable = true;
  };
  
  # 手动写入配置
  xdg.configFile."mako/config".text = with config.lib.stylix.colors; ''
    [global]
    border-radius=8
    border-size=2
    default-timeout=5000
    anchor=top-right
    width=350
    height=100
    margin=10
    padding=10
    background-color=#${base00}
    text-color=#${base05}
    border-color=#${base0D}
    icons=1
    max-icon-size=48
  '';
  
  # 确保目标启用
  stylix.targets.mako.enable = true;
}
