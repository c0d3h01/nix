{
  powerManagement.enable = false; # prevent conflict
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "auto";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
