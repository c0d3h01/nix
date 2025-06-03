{
  lib,
  pkgs,
  ...
}:

{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = false;

    packages = with pkgs; [
      dejavu_fonts
      hack-font
      twitter-color-emoji
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-extra
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      hinting.enable = true;
      hinting.style = "slight"; # Options: "none", "slight", "medium", "full"
      subpixel.lcdfilter = "default";
      subpixel.rgba = "rgb";    # Options: "rgb", "bgr", "vrgb", "vbgr", "none"

      defaultFonts = {
        serif = lib.mkForce [ "DejaVu Serif" "Noto Serif" ];
        sansSerif = lib.mkForce [ "DejaVu Sans" "Noto Sans" ];
        monospace = lib.mkForce [ "Hack" ];
        emoji = lib.mkForce [ "Twitter Color Emoji" ];
      };
    };
  };
}