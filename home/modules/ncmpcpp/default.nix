{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    network.listenAddress = "127.0.0.1";
    network.port = 6600;
    
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Sound Server"
      }
    '';
  };
  
  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp;
    
    settings = {
      # 界面
      ncmpcpp_directory = "${config.home.homeDirectory}/.config/ncmpcpp";
      mpd_host = "127.0.0.1";
      mpd_port = "6600";
      
      # 视觉设置（颜色由 Stylix 自动处理）
      # 解除注释以使用 Stylix 提供的颜色
      colors_enabled = "yes";
      
      # 布局
      playlist_display_mode = "columns";
      browser_display_mode = "columns";
      search_engine_display_mode = "columns";
      playlist_editor_display_mode = "columns";
      
      # 行为
      autocenter_mode = "yes";
      centered_cursor = "yes";
      mouse_support = "yes";
      mouse_list_scroll_whole_page = "no";
      
      # 外观
      user_interface = "alternative";
      header_visibility = "yes";
      statusbar_visibility = "yes";
      titles_visibility = "yes";
      
      # 进度条
      progressbar_look = "━╸";
      progressbar_elapsed_color = "blue";
      progressbar_color = "black";
    };
    
    bindings = [
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "h"; command = "previous_column"; }
      { key = "l"; command = "next_column"; }
      { key = "g"; command = "page"; value = "1"; }
      { key = "G"; command = "page"; value = "end"; }
    ];
  };
}
