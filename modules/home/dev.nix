{ config, pkgs, ... }:

let
  myJdk = pkgs.jdk8;
  jdkPath = "${myJdk}/lib/openjdk";
in
{
  home.packages = with pkgs; [
    jetbrains.idea
    jetbrains.datagrip

    python3

    posting

    myJdk

    maven
  ];

  home.file.".jdk/openjdk-8".source = jdkPath;

  home.sessionVariables = {
    JAVA_HOME = "${config.home.homeDirectory}/.jdk/openjdk-8";
    PATH = "${config.home.homeDirectory}/.jdk/openjdk-8/bin:$PATH";
  };
}
