{
  userConfig,
  lib,
  ...
}:

{
  imports = [
    ./git
    ./programs
    ./shells
    ./system
    ./terminal
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  manual.manpages.enable = false;
  programs.man.enable = lib.mkDefault false;

  home = {
    inherit (userConfig) username;
    shell.enableShellIntegration = false;
    shell.enableIonIntegration = true;
    homeDirectory = "/home/${userConfig.username}";
    stateVersion = lib.trivial.release;
    sessionVariables = {
      EDITOR = "neovim";
      VISUAL = "neovim";
      BROWSER = "firefox";
      TERMINAL = "ghostty";
    };
  };
}
