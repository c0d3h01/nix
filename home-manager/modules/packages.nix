{
  pkgs,
  config,
  nixglLib,
  nixglPackages,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    package = nixglLib.wrap nixglPackages.wezterm;
  };

  home.packages = with pkgs; [
    gitFull
    git-lfs
    lazygit
    neovim
    starship
    bat
    lsd
    fd
    ripgrep
    zoxide
    tmux
    fzf
    mise
    direnv
    nix-direnv
  ];
}
