{ pkgs, ... }:
{
  stylix.image = pkgs.fetchurl {
    url = "https://images.pexels.com/photos/2885320/pexels-photo-2885320.jpeg";
    hash = "sha256-1h19s72a1dc4da5haxcmvfc30bmgnc1z3n6im9818cp1vqj8m4sj=";
  };

  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    monospace = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };
}
