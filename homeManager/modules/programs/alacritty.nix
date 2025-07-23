{ config, pkgs, ... }:
let
  inherit (config.lib.nixGL) wrap;
in
{
  programs.alacritty = {
    enable = true;
    package = wrap pkgs.alacritty;
    theme = "solarized_dark";
    settings = { };
  };
}
