{
  lib,
  osClass,
  ...
}:
let
  inherit (lib) mkOption mapAttrs;
  inherit (lib.types) enum nullOr str;

  mkDefault = name: args: mkOption ({ description = "default ${name} for the system"; } // args);

in
{
  options.garden.programs.defaults = mapAttrs mkDefault {
    shell = {
      type = enum [
        "bash"
        "zsh"
        "fish"
        "nushell"
      ];
      default = if (osClass == "nixos") then "bash" else "zsh";
    };

    terminal = {
      type = enum [
        "ghostty"
        "alacritty"
        "ghostty"
        "kitty"
        "wezterm"
        "foot"
      ];
      default = "ghostty";
    };

    fileManager = {
      type = enum [
        "nautilus"
        "cosmic-files"
        "dolphin"
        "nemo"
      ];
      default = "nautilus";
    };

    browser = {
      type = enum [
        "firefox"
        "chromium"
        "thorium"
        "barav"
      ];
      default = "firefox";
    };

    editor = {
      type = enum [
        "nvim"
        "code"
        "codium"
      ];
      default = "nvim";
    };

    pager = {
      type = str;
      default = "less -FR";
    };

    manpager = {
      type = str;
      default = "nvim +Man!";
    };

    noiseSuppressor = {
      type = nullOr (enum [
        "rnnoise"
        "noisetorch"
      ]);
      default = "rnnoise";
      description = ''
        The noise suppressor to be used for desktop systems with sound enabled.
      '';
    };
  };
}
