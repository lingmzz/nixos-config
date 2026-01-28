{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "alphabetical";
        sort_dir_first = true;
        linemode = "size";
      };
      
      opener = {
        edit = [
          { exec = "$EDITOR \"$@\""; block = true; }
        ];
        play = [
          { exec = "mpv \"$@\""; orphan = true; }
        ];
        open = [
          { exec = "xdg-open \"$@\""; desc = "Open"; }
        ];
      };
    };
    
    keymap = {
      manager.prepend_keymap = [
        { run = "shell \"$SHELL\" --block"; on = [ "!" ]; desc = "Open shell here"; }
      ];
    };
  };
  
  # Stylix 会自动配置 Yazi 主题（通过 flavor）
  stylix.targets.yazi.enable = true;
}
