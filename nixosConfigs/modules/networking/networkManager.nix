{
  pkgs,
  lib,
  userConfig,
  ...
}:

{
  # secrets management service
  services.gnome.gnome-keyring.enable = lib.mkForce true;

  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      plugins = [ pkgs.networkmanager-openvpn ];

      wifi = {
        inherit (userConfig.machineConfig.networking) backend;
        # The below is disabled as my uni hated me for it
        # use a random mac address on every boot, this can scew with static ip
        # macAddress = "random";

        powersave = false;

        # MAC address randomization of a Wi-Fi device during scanning
        scanRandMacAddress = true;
      };
    };
  };
}
