{pkgs, ...}: {
  home.packages = with pkgs; [
    waybar
    pavucontrol
    networkmanagerapplet
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;

        # 布局模块
        modules-left = ["group/container"];
        modules-center = ["cava"];
        modules-right = ["tray" "group/main" "clock" "custom/power"];

        # 左侧 group
        "group/container" = {
          orientation = "inherit";
          modules = ["niri/workspaces"];
        };

        # 右侧 group
        "group/main" = {
          orientation = "inherit";
          modules = ["pulseaudio" "memory" "cpu"];
        };

        "cava" = {
          framerate = 30;
          autosens = 1;
          bars = 14;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          hide_on_silence = true;
          method = "pulse";
          source = "auto";
          stereo = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          noise_reduction = 0.6;
          input_delay = 4;
          sleep_timer = 1;
          format-icons = ["▁" "▂" "▂▃" "▄" "▅" "▆" "▇█" "█"];
          # format-icons = [ " " "▁" "▃" "▄" "▅" "▆" "▇" "█" ];
          actions = {
            on-click-right = "mode";
          };
        };

        # 各模块配置
        "niri/workspaces" = {
          active-only = false;
          all-outputs = false;
          show-special = true;
          special-visible-only = false;
          disable-scroll = true;
          warp-on-scroll = false;
          format = "{name}";
          persistent-workspaces = {"*" = 5;};
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        cpu = {
          format = "{icon} {usage}%";
          interval = 10;
          tooltip = false;
          format-icons = [""];
          on-scroll-up = "";
          on-scroll-down = "";
        };

        memory = {
          interval = 10;
	  format = "󰘚 {percentage}%";
	  format-warning = "󰀧 {percentage}%";
	  format-critical = "󰀧 {percentage}%";
          states = {"warning" = 75; "critical" = 90;};
          tooltip-format = "Memory Used: {used:0.0f}/{total:0.0f} GB";
          on-scroll-up = "";
          on-scroll-down = "";
        };

        tray = {
          icon-size = 20;
          spacing = 10;
        };

        bluetooth = {
          format = "󰂯 {status}";
          format-connected = " {device_alias}";
          on-scroll-up = "";
          on-scroll-down = "";
          on-click = "blueman-manager";
          on-click-right = "rfkill toggle bluetooth";
          tooltip = true;
        };

        clock = {
          timezone = "Asia/Shanghai";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "{format_source}";
          format-source = "󰕿";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            default = ["󰕿" "󰖀" "󰕾"];
          };
          on-click-right = "pavucontrol";
          on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
        "custom/power" = {
          format = "⏻";
          on-click = "wlogout";
          tooltip = false;
        };
      };
    };
  };
  xdg.configFile."waybar/style.css" = pkgs.lib.mkForce {
    text = ''
      /* ===== 高级质感配色方案（莫兰迪色系 + 磨砂玻璃效果）===== */
      @define-color bg-primary rgba(30, 32, 40, 0.4);
      /* 主背景：深灰半透明 */
      @define-color bg-secondary rgba(46, 52, 64, 0.3);
      /* 次级背景 */
      @define-color accent-primary #8FBCBB;
      /* 主色：冰川蓝 */
      @define-color accent-secondary #D08770;
      /* 次色：陶土粉 */
      @define-color text-primary #E5E9F0;
      /* 主文本 */
      @define-color text-dim #81A1C1;
      /* 弱化文本 */
      @define-color border-glass rgba(136, 192, 208, 0.2);
      /* 玻璃边框 */
      @define-color urgent #BF616A;
      /* 警告色 */

      /* ===== 全局基础设置 ===== */
      * {
        font-family: "FiraCode Nerd Font Mono", "JetBrains Mono", sans-serif;
        font-size: 14px;
        font-weight: 500;
        min-height: 0;
        border: none;
        border-radius: 0;
        padding: 0;
        margin: 0;
      }

    /* =========== 动画设置========= */
    @keyframes work {
      0% {
        padding: 0px 10px;
      }

      50% {
        padding: 0px 16px;
        /* 可以决定动画强度 */
      }

      100% {
        padding: 0px 10px;
      }
    }

    /* ===== 辅助动画效果 ===== */
    @keyframes fade-in {
      from {
        opacity: 0;
      }

      to {
        opacity: 1;
      }
    }

    window#waybar {
      background: transparent;
      color: @text-primary;
    }

    /* ===== 左侧模块容器 ===== */
    #container {
      background: @bg-primary;
      border-radius: 24px;
      padding: 0 12px;
      margin: 2px 0 2px 8px;
      border: 1px solid @border-glass;
      box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.1);
    }

    /* ----- Logo ----- */
    #custom-logo {
      font-size: 18px;
      color: @accent-primary;
      margin-right: 8px;
    }

    /* ----- 工作区 ----- */
    #workspaces {
      background: transparent;
      padding: 0 4px;
    }

    /* ----- Icon ----- */
    #custom-icon {
      font-size: 18px;
      color: @accent-primary;
      margin-right: 8px;
    }

    #workspaces button {
      padding: 0 12px;
      margin: 4px 2px;
      border-radius: 16px;
      color: @text-dim;
      background: rgba(67, 76, 94, 0.2);
      box-shadow: inset 0 0 0 1px rgba(136, 192, 208, 0.1);
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    #workspaces button.active,
    button.special.active {
      font-weight: bold;
      animation: work 300ms ease-out;
      background: linear-gradient(135deg, @accent-primary, @accent-secondary);
      color: @text-primary;
    }


    /* 特殊工作区激活时样式 */
    /* #workspaces button.special.active {
    } */

    #workspaces button.empty.active {
      background: linear-gradient(135deg, @accent-primary, @accent-secondary);
    }

    #workspaces button.empty {
      color: rgba(129, 161, 193, 0.2);
      background: transparent;
    }

    #workspaces button.urgent {
      background-color: @urgent;
      color: @text-primary;
    }

    #workspaces button:hover {
      transition: all 300ms ease-in-out;
      background: rgba(143, 188, 187, 0.2);
      color: @text-primary;
    }

    /* ========== 中间模块 ========== */
    /* -----cava----- */
    #cava {
      color: @text-primary;
    }

    #cava.updated {
      background: linear-gradient(135deg, @accent-primary, @accent-secondary);
      border-radius: 16px;
      margin: 4px 2px;
      padding: 0px 16px;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    /* #cava.silent { */
    /**/
    /* } */

    /* ===== 右侧系统模块 ===== */
    #main {
      background: @bg-primary;
      border-radius: 24px;
      padding: 0 12px;
      margin: 2px 8px 2px 0;
      border: 1px solid @border-glass;
      box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.1);
    }

    /* ----- 统一模块样式 ----- */
    #clock,
    #pulseaudio,
    #cpu,
    #memory,
    #tray,
    #bluetooth,
    #custom-wf-recorder,
    #custom-powerprofile {
      padding: 0 12px;
      margin: 4px 2px;
      font-weight: bold;
      border-radius: 16px;
      transition: background 0.3s ease;
      background: @bg-secondary;
    }

    /* ----- 时钟 ----- */
    #clock {
      color: @text-primary;
      font-weight: bold;
      background: linear-gradient(135deg, @accent-primary, @accent-secondary);
    }

    /* ----- 音频控制 ----- */
    #pulseaudio {
      color: @text-primary;
    }

    #pulseaudio.muted {
      color: @text-dim;
    }

    /* ----- 系统资源 ----- */
    #cpu {
      color: @text-primary;
    }

    #memory {
      color: @text-primary;
    }
    /* ----- 蓝牙 ----- */
    #bluetooth {
      color: @accent-primary;
    }

    #bluetooth.off {
      color: @text-dim;
    }

    /* ----- 电源模式 ----- */
    #custom-powerprofile {
      font-size: 13px;
      color: @text-primary;
    }

    /* ----- 系统托盘 ----- */
    #tray {
      padding: 0 8px;
    }

    #tray>.passive {
      -gtk-icon-effect: dim;
    }

    #tray>.needs-attention {
      -gtk-icon-effect: highlight;
      background: @urgent;
    }


    #workspaces button,
    #main>* {
      animation: fade-in 0.5s ease-out;
    }

    /* ===== 模块悬停反馈 ===== */
    #clock:hover,
    #pulseaudio:hover,
    #cpu:hover,
    #memory:hover,
    #tray:hover,
    #bluetooth:hover,
    #custom-wf-recorder:hover,
    #custom-powerprofile:hover {
      background: rgba(143, 188, 187, 0.3);
    }
    #custom-power {
      color: #f38ba8;  /* 红色 */
      padding: 0 10px;
      font-size: 16px;
    }

    #custom-power:hover {
      color: #fab387;  /* 悬停颜色 */
    }
    '';
  };
}
