{
  config,
  lib,
  pkgs,
  userConfig,
  ...
}:
let
  inherit (lib) mkIf;
  cfg = userConfig.machineConfig.gpuType;
  isWorskstaion = userConfig.machineConfig.workstation.enable;
in
{
  config = mkIf (cfg == "intel") {

    # xorg drivers
    services.xserver.videoDrivers = [ "modesetting" ];

    hardware.graphics = lib.mkIf isWorskstaion {
      enable = true;

      extraPackages = with pkgs; [
        intel-media-driver
        libva-vdpau-driver
        intel-compute-runtime
        vpl-gpu-rt # Quick Sync Video
      ];

      enable32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
        libva-vdpau-driver
        intel-compute-runtime
      ];
    };

    # Essential GPU utilities
    environment.systemPackages = with pkgs; [
      glxinfo
      vulkan-tools
      vulkan-loader
      libva-utils
      clinfo
      intel-gpu-tools
    ];

    # Environment variables for optimal GPU performance
    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
      VDPAU_DRIVER = "iHD";
      OCL_ICD_VENDORS = "intel";
    };
  };
}
