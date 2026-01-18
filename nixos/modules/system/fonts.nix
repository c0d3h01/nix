{pkgs, ...}: {
  fonts.packages = with pkgs; [
    corefonts
    dejavu_fonts
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    inter
  ];

  fonts.fontconfig = {
    enable = true;
    antialias = true;
    subpixel.rgba = "rgb";
    hinting = {
      enable = true;
      style = "slight";
    };
    defaultFonts = {
      sansSerif = ["DejaVu Sans"];
      serif = ["DejaVu Serif"];
      monospace = ["DejaVu Sans Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
