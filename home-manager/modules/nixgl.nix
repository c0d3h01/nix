{
  config,
  userConfig,
  lib,
  nixglLib,
  nixglPackages,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = userConfig.machineConfig;
in
{
  config = mkIf cfg.glApps {
    # NixGL configuration for GPU support
    targets.genericLinux.nixGL = {
      vulkan.enable = true;
      defaultWrapper = "mesa";
      offloadWrapper = "mesa";
      installScripts = [ "mesa" ];
    };
  };
}
