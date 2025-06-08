{ pkgs, lib, ... }:

{
  gtk = {
    enable = true;

    theme = lib.mkDefault {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = lib.mkDefault {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = lib.mkDefault {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    # GTK optimization settings
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-enable-animations = 1;
      gtk-toolbar-style = "GTK_TOOLBAR_BOTH_HORIZ";
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };
}
