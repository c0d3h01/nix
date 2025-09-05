{
  pkgs,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      # Terminal Utilities
      tmux
      xclip
      curl
      wget
      tree
      stow
      file
      icdiff
      glances
      # fzf
      just
      gdu # Disk usage analyzer CLI
      imagemagick
    ]
    ++ [
      # Language Servers
      lua-language-server
      nil
    ]
    ++ [
      # Desk App
      # Notion App with patch infinity loading
      (callPackage ./notion-app { })
    ];
}
