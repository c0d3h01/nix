{
  inputs,
  config,
  userConfig,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    inputs.stylix.homeModules.stylix

    ./git
    ./programs
    ./shells
    ./system
    ./terminal
    ./stylix.nix
    ./variables.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    inherit (userConfig) username;
    # homeDirectory = "/home/${userConfig.username}";
    homeDirectory =
      if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
    stateVersion = lib.trivial.release;
  };
}
