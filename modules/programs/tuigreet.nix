{ config, pkgs, ... }:

{
  # 启用 greetd + tuigreet
  services.greetd = {
    enable = true;
    
    settings = {
      default_session = {
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
            --time \
            --asterisks \
            --remember \
            --remember-user-session \
            --cmd niri-session
        '';
      };
      
      initial_session = {
        command = "niri-session";
        user = "min";
      };
    };
  };
  # Stylix 会自动处理 GDM 主题（通过 targets.gnome）
}
