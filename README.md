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

## Flake System Overview

### Inputs (flake.nix)
- **nixpkgs**: Custom fork with unstable small channel
- **home-manager**: User environment management
- **disko**: Declarative disk partitioning
- **pre-commit-hooks**: Code quality automation
- **sops-nix/agenix**: Secret management
- **spicetify-nix**: Spotify theming

### Outputs Structure
- **nixosConfigurations.NixOS**: System configuration
- **homeConfigurations**: Standalone home-manager configs
- **formatter**: nixfmt-tree for consistent formatting
- **checks**: Pre-commit hooks (alejandra, statix, deadnix)

### User Configuration
The `userConfig` object in flake.nix centralizes user settings:
```nix
userConfig = {
  username = "c0d3h01";
  fullName = "Harshal Sawant"; 
  email = "harshalsawant.dev@gmail.com";
  hostname = "NixOS";
  stateVersion = "25.05";
};
```

## Module System

### NixOS Modules (nixos/)
System-wide configurations:
- **audio.nix**: PipeWire/ALSA audio setup
- **fonts.nix**: System font configuration
- **networking.nix**: Network and firewall settings
- **security.nix**: Security policies and authentication

### Application Modules (apps/)
Development tools and applications:
- **tools/**: Language-specific development environments
- **myModules**: Custom module system with enable flags

### Home Modules (home/modules/)
User-space configurations managed by home-manager

## Code Style Guidelines

### Formatting & Linting
- **Primary formatter**: `nixfmt-tree` (run via `nix fmt`)
- **Pre-commit hooks**: alejandra, statix (dead code), deadnix (unused bindings)
- **Line length**: Follow nixfmt-tree defaults (~100 chars)

### Nix Conventions
- **Attributes**: Use camelCase (`enableSomething = true`)
- **Packages**: Use kebab-case in package names
- **Module structure**: 
  ```nix
  { pkgs, config, userConfig, ... }: {
    imports = [ ./submodule.nix ];
    # configuration here
  }
  ```

## Troubleshooting

### Common Issues
- **Flake lock conflicts**: Run `nix flake update` to resolve
- **Home-manager conflicts**: Remove existing home-manager installation before using flake version
