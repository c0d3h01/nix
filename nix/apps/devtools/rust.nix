{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup

    # Rust tools
    rustup
    cargo
    rust-analyzer
    rustfmt
    clippy

    # Additional cargo tools
    cargo-watch
    cargo-edit
    cargo-audit
    cargo-tarpaulin
  ];

  programs.zsh.shellInit = ''
    export RUSTUP_HOME="$HOME/.rustup"
    export CARGO_HOME="$HOME/.cargo"
    # source ${pkgs.rustup}/share/zsh/site-functions/_rustup
  '';
}
