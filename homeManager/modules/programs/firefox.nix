{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (config.lib.nixGL) wrap;
in
{
  programs.firefox = {
    enable = true;
    package = wrap pkgs.firefox;
  };
}
