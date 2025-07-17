{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkIf mkForce mkEnableOption;

  cfg = config.garden.programs.gnome;
in
{
  options.garden.programs.gnome = {
    enable = mkEnableOption "enable gnome environment";
  };

  config = mkIf cfg.enable {
    services.desktopManager.gnome.enable = true;
    services.displayManager.gdm.enable = true;
    services.gnome.gnome-remote-desktop.enable = mkForce false;

    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-font-viewer
      epiphany
      yelp
      baobab
      gnome-music
      gnome-remote-desktop
      gnome-usage
      gnome-console
      gnome-contacts
      gnome-weather
      gnome-maps
      gnome-connections
      gnome-system-monitor
      gnome-user-docs
    ];

    garden.packages = {
      inherit (pkgs)
        gnome-photos
        gnome-tweaks
        ;
    };
  };
}
