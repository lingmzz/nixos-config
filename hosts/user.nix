{ config, pkgs, username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    description = "Primary User";
    
    extraGroups = [ 
      "wheel"           # sudo 管理员权限
      "networkmanager"  # 管理网络连接
      "audio"           # 音频设备访问
      "video"           # 摄像头/显卡访问
      "input"           # 输入设备
      "plugdev"         # USB 设备
      "docker"        # Docker
      "libvirtd"      # 虚拟机
    ];
    
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    wget
    curl

    #todesk
  ];

  #services.todesk.enable = true;
  
  # Sudo 权限配置
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;      # true = 需要密码（安全）；false = 免密（风险）
  };

  programs.fish.enable = true;
  
  programs.bash.enable = true;

  programs.nix-ld.enable = true;

  programs.firefox.enable = true;

  programs.npm = {
    enable = true;
    npmrc = ''
      prefix=$HOME/.npm-global;
    '';
  };

  # 全局环境变量
  environment.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
    BROWSER = "google-chrome";
  };
  
  # SSH 守护
  services.openssh = {
    enable = false;  # 如需远程登录改为 true
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;  # 如使用密钥登录，改为 false
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  nixpkgs.config.allowUnfree = true;
}
