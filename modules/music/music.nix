{pkgs, ...}: {
  home.packages = with pkgs; [
    mpc
  ];
  services.mpd.enable = true;
  services.mpd = {
    musicDirectory = "/home/min/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }

      restore_paused "yes"
      auto_update "yes"
    '';
  };
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = "/home/min/Music";
    settings = {
      lyrics_directory = "/home/min/Music";
      store_lyrics_in_song_dir = "yes";
    };
  };
}
