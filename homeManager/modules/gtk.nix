{
  lib,
  userConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf userConfig.machineConfig.workstation {

    home = {
      # gtk applications should use xdg specified settings
      sessionVariables.GTK_USE_PORTAL = "1";

      pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };
    };

    # GTK theming
    gtk = {
      enable = true;

      # font = {
      #   name = ;
      #   size = ;
      # };

      theme = {
        name = "Adwaita-Dark";
        package = pkgs.gnome-themes-extra;
      };

      iconTheme = {
        name = "Adwaita";
        package = pkgs.gnome-themes-extra;
      };

      cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };

      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };

      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };
}
