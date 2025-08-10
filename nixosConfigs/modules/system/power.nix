{
  lib,
  userConfig,
  ...
}:
let
  isLaptop = userConfig.machineConfig.type == "laptop";
in
{
  # Power management
  services.power-profiles-daemon.enable = lib.mkIf isLaptop false;

  # Auto CPU frequency scaling for laptops
  services.auto-cpufreq = lib.mkIf isLaptop {
    enable = true;
    settings = {
      battery = {
        governor = "schedutil";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
