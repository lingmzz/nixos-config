{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = false;  # Niri 手动启动
    
    # Stylix 会自动生成样式，但如果您想自定义：
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        
        modules-left = [ "niri/workspaces" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "battery" "pulseaudio" "tray" ];
        
        "niri/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };
        
        "niri/window" = {
          max-length = 50;
        };
        
        clock = {
          format = "{:%Y-%m-%d %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt>{calendar}</tt>";
        };
        
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };
        
        network = {
          format-wifi = "󰤨 {essid}";
          format-ethernet = "󰈀 {ipaddr}";
          format-disconnected = "⚠ Disconnected";
        };
        
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰖁 Muted";
          format-icons = {
            default = ["󰕿" "󰖀" "󰕾"];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
        
        tray = {
          spacing = 10;
        };
      };
    };
    
    # CSS 样式：留空让 Stylix 自动生成，或覆盖特定部分
    # stylix.targets.waybar.enable = false;  # 如要完全自定义样式
    style = ''
      /* Stylix 会自动生成基础样式，这里添加微调 */
      #waybar {
        font-family: "${config.stylix.fonts.sansSerif.name}";
        font-size: ${toString config.stylix.fonts.sizes.desktop}px;
      }
    '';
  };
}
