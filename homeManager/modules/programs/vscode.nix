{ config, pkgs, ... }:
let
  inherit (config.lib.nixGL) wrap;
in
{
  programs.vscode = {
    enable = true;
    package = wrap pkgs.vscode-fhs;
  };
}
