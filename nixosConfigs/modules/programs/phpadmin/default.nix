{
  pkgs,
  userConfig,
  lib,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    lib.mkIf userConfig.dev.phpadmin [
      (callPackage ./config.nix { })
    ];
}
