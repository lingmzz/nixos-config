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
        modules-right = ["tray" "group/main" "clock"];

        # 左侧 group
        "group/container" = {
          orientation = "inherit";
          modules = ["custom/logo" "niri/workspaces"];
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
        "custom/logo" = {
          format = "";
          tooltip = false;
          on-scroll-up = "";
          on-scroll-down = "";
        };

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
      };
    };
  };

  xdg.configFile.".config/waybar/style.css".source = ./style.css;

}
