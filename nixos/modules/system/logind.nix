{
  lib,
  config,
  userConfig,
  ...
}:
{
  config = lib.mkIf (userConfig.machineConfig.type == "laptop") {
    # Let logind manage power actions on laptops
    services.logind = {
      enable = true;
      settings.Login = {
        HandleLidSwitchDocked = "ignore";
        HandleLidSwitchExternalPower = "suspend-then-hibernate";
      };
      powerKey = "suspend-then-hibernate";
    };

    systemd.sleep.extraConfig = ''
      AllowSuspend=yes
      AllowHibernation=yes
      AllowSuspendThenHibernate=yes
      AllowHybridSleep=yes
      HibernateDelaySec=45min
    '';
  };
}
