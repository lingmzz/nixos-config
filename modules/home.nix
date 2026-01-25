{
  config,
  pkgs,
  lib,
  ...
}: {
  home.username = "min";
  home.homeDirectory = "/home/min";
  home.stateVersion = "25.11";
  
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ./fcitx5/fcitx5.nix
    ./waybar/waybar.nix
    ./dev/dev.nix
    ./music/music.nix
    ./wallpaper/wallpaper.nix
    ./rofi/rofi.nix
    ./niri/niri.nix
    ./mako/mako.nix
    ./fish/fish.nix
    ./kitty/kitty.nix
  ];

  home.packages = with pkgs; [
    jq
    btop
    tree
    obsidian
  ];

  programs.mpv.enable = true;
  
  programs.fastfetch = {
    enable = true;
  };
  
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-airline ];
    settings = { ignorecase = true; };
    extraConfig = ''
      "显示行号
      set number
      "显示相对行号
      set relativenumber
      "高亮当前行
      set cursorline
      "语法高亮
      syntax on 

      " 开启自动缩进，新的一行会自动与上一行对齐
      set autoindent
      " 在输入搜索词时，实时高亮显示匹配项（增量搜索）
      set incsearch
      
      " 高亮显示所有搜索结果
      set hlsearch

      " 搜索时忽略大小写
      set ignorecase

      " 如果搜索词中包含了大写字母，则自动切换为大小写敏感搜索
      set smartcase
      " 开启持久化撤销（undo），即使关闭再打开文件，也能撤销之前的更改
      set undofile
      " undo目录
      silent !mkdir -p ~/.cache/vim/undo
      set undodir=~/.cache/vim/undo
      " 剪贴板 gvim的功能
      set clipboard=unnamedplus
      " 接管鼠标事件
      set mouse=a
    '';
  };

  # 自动创建截图文件夹
  #home.activation.ensureScreenshotDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #  mkdir -p "${config.home.homeDirectory}/screenshot"
  #'';

  services.polkit-gnome.enable = true; # 权限认证

  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "image/png" = ["imv.desktop"];
    "image/jpeg" = ["imv.desktop"];
    "image/gif" = ["imv.desktop"];
    "text/html" = ["google-chrome.desktop"];
  };

  # 光标配置
  #home.pointerCursor = {
  #  enable = true;
  #  package = pkgs.adwaita-icon-theme;
  #  name = "Adwaita";
  #  size = 24;
  #};

}
