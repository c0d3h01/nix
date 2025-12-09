{
  lib,
  pkgs,
  userConfig,
  ...
}: let
  inherit (lib) mkDefault;
in {
  # Set hostname
  networking.hostName = userConfig.hostname;

  # System state version
  system.stateVersion = "25.11";

  # Zsh program enabled as default user
  programs.zsh.enable = true;

  # configure a setcap wrapper
  programs.mtr.enable = true;

  # Image/video preview
  services.tumbler.enable = true;

  # Mounting USB & More
  services.gvfs.enable = true;

  # smartd daemon from smartmontools package
  services.smartd = {
    enable = true;
    autodetect = true;
  };

  # Create the main user
  users.users.${userConfig.username} = {
    isNormalUser = true;
    description = userConfig.fullName;

    # z - shell default for users
    shell = pkgs.zsh;

    # Add global user groups
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "pipewire"
      "video"
    ];
  };
}
