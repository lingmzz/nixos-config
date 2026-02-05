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

    plugins = {
      DockerManager = {
        src = pkgs.fetchFromGitHub {
          owner = "LuckShiba";
          repo = "DmsDockerManager";
          rev = "v1.2.0";
          sha256 = "sha256-VoJCaygWnKpv0s0pqTOmzZnPM922qPDMHk4EPcgVnaU=";
        };
      };
    };
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor = {
      name = "niri";
      customConfig = ''
      '';
    };
    configHome = "/home/min";
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

  nixpkgs.config.allowUnfree = true;
}
