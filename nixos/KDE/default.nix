{
  services = {
    displayManager = {
      sddm.enable = true;
      plasma6.enable = true;
    };
  };

   environment.gnome.excludePackages = with pkgs; [
     kdePackages.kate
   ];
}