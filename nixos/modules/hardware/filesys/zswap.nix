{ lib, userConfig, ... }:
let
  isLaptop = userConfig.machineConfig.type == "laptop";
in
{
  # ZRAM configuration
  zramSwap = lib.mkIf isLaptop {
    enable = true;
    priority = 100;
    algorithm = "lzo-rle";
    memoryPercent = 100;
  };
}
