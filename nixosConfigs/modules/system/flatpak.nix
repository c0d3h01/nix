{
  lib,
  userConfig,
  ...
}:
{
  # flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  config = lib.mkIf userConfig.machine.workstation {
    services.flatpak.enable = false;
    environment.sessionVariables.XDG_DATA_DIRS = [ "/var/lib/flatpak/exports/share" ];
  };
}
