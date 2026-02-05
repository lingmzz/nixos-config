{pkgs, ...}: {
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu = {
    runAsRoot = false;
    swtpm.enable = true;
    vhostUserPackages = [
      pkgs.virtiofsd
    ];
  };
  programs.virt-manager.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    daemon.settings = {
      registry-mirrors = [
        "https://docker.mirrors.ustc.edu.cn"
        "https://mirror.ccs.tencentyun.com"
        "https://hub-mirror.c.163.com"
      ];
    };
  };
}
