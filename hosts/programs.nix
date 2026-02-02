{ config, pkgs, username, ... }:

{
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    wget
    curl
    cava

    #todesk
  ];

  #services.todesk.enable = true;

  programs.niri.enable = true;

  programs.dms-shell = {
    enable = true;
    
    systemd.enable = true;
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
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

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  nixpkgs.config.allowUnfree = true;
}
