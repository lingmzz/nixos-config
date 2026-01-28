{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mako
    libnotify
  ];

#  catppuccin.mako = {
#    enable = true;
#    accent = "mauve";
#    flavor = "mocha";
#  };
  xdg.configFile = {
    "mako/config" = {
      source = pkgs.writeText "mako-config" ''
        border-radius=8
        border-size=2
        default-timeout=5000
        background-color=#282a36
        border-color=#282a36
         
        [urgency=low]
        border-color=#282a36
        [urgency=normal]
        border-color=#f1fa8c
        [urgency=high]
        border-color=#ff555a
      '';
      force = true;
    };
  };
}
