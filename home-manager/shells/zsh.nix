{ lib, config, ... }:
let
  inherit (lib) mkOrder;
in
{
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    # oh-my-zsh = {
    #   enable = true;
    #   theme  = "robbyrussell";
    #   plugins = [
    #     "git"
    #     "sudo"
    #   ];
    # };

    dotDir = "${config.xdg.configHome}/zsh";

    initContent = mkOrder 1000 ''
      function title_precmd_hook() {
        print -Pn "\e]0;$(pwd)\a"
      }
      precmd_functions+=title_precmd_hook
    '';
  };
}
