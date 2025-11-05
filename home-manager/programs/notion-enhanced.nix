{
  pkgs,
  lib,
  userConfig,
  ...
}:
let
  inherit (lib) optionals;
  isWorkstation = userConfig.machineConfig.workstation.enable;
in
{
  home.packages =
    with pkgs;
    optionals isWorkstation [
      # Desk App
      (callPackage ./notion-app { })
    ];
}
