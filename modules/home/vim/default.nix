{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    packageConfigurable = pkgs.vim-full;
    
    settings = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      mouse = "a";
    };
    
    extraConfig = ''
      " 基础设置
      syntax on
      filetype plugin indent on
      set termguicolors
      set number
      set autoindent
      set incsearch
      set hlsearch
      set ignorecase
      set smartcase
      set mouse=a
      
      " Stylix 会通过 base16-vim 自动设置 colorscheme
      " 不需要手动设置 colorscheme base16-stylix
    '';
    
    plugins = with pkgs.vimPlugins; [
      # Stylix 会自动配置 base16-vim
      vim-airline
      vim-airline-themes
    ];
  };
}
