{pkgs, ...}: {
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  #environment.variables = {
  #  XDG_DATA_DIRS = [
  #    "/var/lib/flatpak/exports/share"
  #    "/home/min/.local/share/flatpak/exports/share"
  #  ];
  #};
}
