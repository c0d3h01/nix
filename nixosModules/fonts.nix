{
  lib,
  pkgs,
  ...
}:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      cascadia-code
      source-sans
      source-serif
    ];
    fontconfig = {
      enable = true;

      antialias = true;
      hinting.enable = true;
      hinting.style = "slight"; # Options: "none", "slight", "medium", "full"
      subpixel.lcdfilter = "default";
      subpixel.rgba = "rgb"; # Options: "rgb", "bgr", "vrgb", "vbgr", "none"

      defaultFonts = {
        serif = [
          "Source Serif Pro"
          # "Noto Serif"
        ];
        sansSerif = [
          "Source Sans Pro"
          # "Noto Sans"
        ];
        monospace = [
          # "JetBrainsMono Nerd Font"
          # "FiraCode Nerd Font"
          "Cascadia Code Nerd Font"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };
}
