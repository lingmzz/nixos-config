{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    
    settings = {
      mgr = {
        show_hidden = false;
        sort_by = "alphabetical";
        sort_dir_first = true;
        linemode = "size";
      };
      
      opener = {
        edit = [
          { run = "$EDITOR \"$@\""; block = true; }
        ];
        play = [
          { run = "mpv \"$@\""; orphan = true; }
        ];
        open = [
          { run = "xdg-open \"$@\""; desc = "Open"; }
        ];
      };
    };
    
    keymap = {
      manager.prepend_keymap = [
        { run = "shell \"$SHELL\" --block"; on = [ "!" ]; desc = "Open shell here"; }
      ];
    };
  };
  
 }
