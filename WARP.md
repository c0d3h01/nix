# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

NixOS dotfiles repository using flakes, Home Manager, and a modular configuration structure. Manages system-level and user-level configurations across multiple machines with machine-specific settings.

## Common Commands

### Development & Testing
```bash
# Check flake syntax and validate
nix flake check --all-systems
just check

# Enter development shell (includes just, sops, git-crypt, age, formatters)
nix develop

# Format code (runs nixfmt, deadnix, statix, shellcheck, shfmt, etc.)
nix fmt
```

### Building & Deployment
```bash
# Rebuild NixOS system for a host
just rebuild <hostname>
sudo nixos-rebuild switch --flake ".#<hostname>"

# Rebuild Home Manager for a host
just home <hostname>
home-manager switch --flake ".#<hostname>"

# Clean Nix store and optimize
just clean
```

### Installation
```bash
# Apply Home Manager configuration from GitHub
nix run github:nix-community/home-manager -- switch --flake 'github:c0d3h01/dotfiles#c0d3h01@firus'

# Full NixOS installation (includes Disko partitioning)
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- \
  --mode destroy,format,mount --yes-wipe-all-disks --flake github:c0d3h01/dotfiles#c0d3h01
sudo nixos-install --flake github:c0d3h01/dotfiles#c0d3h01 --no-root-passwd
```

## Architecture

### Configuration Flow
The flake orchestrates two parallel configuration systems:
1. **NixOS System** (`nixos/flake-module.nix`): System-level configs, generated for each host in `systems/config.nix`
2. **Home Manager** (`home-manager/flake-module.nix`): User-level configs, supports both `hostname` and `user@hostname` formats

Both systems:
- Read host definitions from `systems/config.nix`
- Use `userConfig` special argument to access machine-specific settings
- Support conditional configuration via `userConfig.machineConfig` flags

### Directory Structure
```
flake/               # Flake utilities (devshell, formatter, checks)
systems/             # Machine definitions and hardware configs
  config.nix         # Host registry (userConfig definitions)
  laptop/            # Specific machine configs
nixos/modules/       # System-level modules
  hardware/          # CPU/GPU/bootloader configs
  networking/        # Network backends (iwd/wpa_supplicant)
  services/          # System services
  security/          # Security settings
home-manager/modules/  # User-level modules
  programs/          # User applications
  terminal/          # Terminal configs
secrets/             # SOPS-encrypted secrets and git-crypt files
```

### Configuration Pattern
```nix
{ lib, pkgs, config, userConfig, ... }:
let
  inherit (lib) optionals mkIf mkDefault;
in
{
  # Conditional packages based on machine type
  home.packages = optionals userConfig.machineConfig.workstation.enable [
    pkgs.example-package
  ];
  
  # Conditional services
  services.example.enable = mkIf (userConfig.machineConfig.laptop.enable) true;
}
```

### Host Configuration (`systems/config.nix`)
Each host defines:
- **User info**: username, hostname, fullName, system architecture
- **machineConfig**: Hardware flags (laptop/server/workstation, CPU/GPU types, bootloader, window manager, network backend)
- **devStack**: Development tools (ollama, docker/podman, virtualization, SQL)

Modules use `userConfig.machineConfig.*` to conditionally enable features.

## Key Technologies & Integration

### Secrets Management
- **SOPS** for encrypted secrets (`.age` files)
- **git-crypt** for encrypted git repositories (see `.gitattributes`)
- Never commit unencrypted secrets

### Flake Inputs
- `nixpkgs`: NixOS unstable
- `home-manager`: User environment management
- `disko`: Declarative disk partitioning
- `sops`: Secrets management
- `chaotic`: Additional packages (chaotic-nyx)
- `spicetify`: Spotify customization

### Conditional Configuration
Use `userConfig.machineConfig` flags to enable/disable features:
- `machineConfig.laptop.enable`: Laptop-specific settings
- `machineConfig.workstation.enable`: Development packages
- `machineConfig.cpuType`: "amd" | "intel"
- `machineConfig.gpuType`: "amd" | "nvidia" | "intel"
- `machineConfig.windowManager`: "gnome" | "kde"
- `devStack.container`: "docker" | "podman"

## Code Conventions

### Nix Style
- Use `lib.mkDefault` for optional configurations
- Use `optionals` for conditional package lists
- Use `inherit` for clean variable passing
- Follow functional programming principles
- camelCase for variable names

### Module Structure
- Group related configs in modules
- Use `default.nix` for module aggregation
- Keep machine-specific configs in `systems/`
- Separate by category (hardware, networking, services, programs)

### Import Pattern
```nix
{
  imports = [
    ./module1.nix
    ./module2.nix
  ];
}
```

## Formatter Configuration
The project uses `treefmt` with multiple formatters:
- **nixfmt**: Nix code formatting
- **deadnix**: Remove unused Nix code
- **statix**: Nix linting and fixes
- **shellcheck/shfmt**: Shell script formatting
- **stylua**: Lua formatting
- **taplo**: TOML formatting
- **mypy**: Python type checking
- **actionlint**: GitHub Actions validation

Excluded: `secrets/*`, `.envrc`, `*.lock`, `*.patch`, `*.age`

## Development Workflow
1. Make changes to relevant module
2. Run `nix flake check` to validate syntax
3. Run `nix fmt` to format code
4. Test with `just rebuild <hostname>` or `just home <hostname>`
5. For debugging: use `nix repl`, `journalctl -u <service>`, or `nix why-depends`

## Adding a New Host
1. Add entry to `systems/config.nix` with userConfig
2. Create hardware config in `systems/<hostname>/`
3. Set machineConfig and devStack flags
4. Rebuild: `just rebuild <hostname>`
