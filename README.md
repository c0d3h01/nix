# c0d3h01's NixOS Dotfiles

Personal NixOS configuration with flakes and home-manager.

> [!NOTE]   
> I use disko for paritioning with btrfs filesystem    

## Installation commands

```bash

$ sudo nix --experimental-features "nix-command flakes" run \
github:nix-community/disko/latest -- --mode destroy,format,mount ./machines/installer/disko-config.nix

$ sudo nixos-install --flake .#NixOS

```

## Daily Commands

### System Management
- **Apply system changes**: `sudo nixos-rebuild switch --flake .#NixOS`
- **Apply home changes**: `home-manager switch --flake .#c0d3h01@NixOS`
- **Test before applying**: `nixos-rebuild test --flake .#NixOS`
- **Format code**: `nix fmt`
- **Update flakes**: `nix flake update`
- **Check syntax**: `nix flake check`

### Development
- **Build without applying**: `nixos-rebuild build --flake .#NixOS`
- **Show flake info**: `nix flake show`
- **Debug build (Enabled by config)**: `nixos-rebuild build --flake .#NixOS --show-trace`
