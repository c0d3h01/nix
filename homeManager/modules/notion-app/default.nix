{
  lib,
  userConfig,
  pkgs,
  ...
}:

{
  home.packages =
    with pkgs;
    lib.mkIf userConfig.machineConfig.workstation [
      (callPackage ./patch { })
    ];
}
