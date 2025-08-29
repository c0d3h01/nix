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
      settings.Login = {
        HandleLidSwitch = "ignore";
        HandleLidSwitchDocked = "ignore";
        HandlePowerKey = "suspend-then-hibernate";
        HandleLidSwitchExternalPower = "suspend-then-hibernate";
      };
    };
  };
}
