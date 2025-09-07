{
  lib,
  config,
  userConfig,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  config = mkIf (userConfig.machineConfig.type == "laptop") {
    services = {
      tuned = {
        enable = true;

        # auto magically change the profile based on the battery charging state
        ppdSettings.main.battery_detection = true;
      };
    };
  };
}
