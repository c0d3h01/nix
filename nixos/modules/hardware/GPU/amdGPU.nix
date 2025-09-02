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
  config = mkIf (cfg == "amd") {

    # xorg drivers
    services.xserver.videoDrivers = [ "amdgpu" ];

    hardware.graphics = lib.mkIf isWorskstaion {
      enable = true;

      extraPackages = with pkgs; [
        mesa
        amdvlk
        libva-vdpau-driver
        rocmPackages.clr
        rocmPackages.clr.icd
      ];

      enable32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [
        mesa
        amdvlk
        libva-vdpau-driver
      ];
    };

    # Essential GPU utilities
    environment.systemPackages = with pkgs; [
      glxinfo
      vulkan-tools
      vulkan-loader
      libva-utils
      clinfo
    ];

    # Environment variables
    environment.sessionVariables = {
      # VA-API: Use the Gallium driver (modern) or radeonsi
      # Note: Newer systems use `radeonsi` or `venus` (for AV1), but `radeonsi` is safe default
      LIBVA_DRIVER_NAME = "radeonsi";

      # VDPAU driver selection
      VDPAU_DRIVER = "radeonsi";
    };
  };
}
