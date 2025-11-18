# NixGL Home Manager Integration

## Overview

This module provides NixGL integration for Home Manager, allowing OpenGL applications to work properly on non-NixOS systems.

## How It Works

The nixGL module:
1. **Auto-detects GPU type** from `machineConfig.gpuType` (amd/intel/nvidia)
2. **Provides a wrapper function** `config.lib.nixGL.wrap` to wrap packages with nixGL
3. **Installs nixGL packages** when enabled via `machineConfig.glApps`

## Configuration

### Enable nixGL

In your host configuration (`hosts/config.nix`):

```nix
machineConfig = {
  glApps = true;  # Enable nixGL wrapper
  gpuType = "amd"; # Options: "amd" | "nvidia" | "intel"
  # ... other config
};
```

### Using the Wrapper

In your home-manager modules (e.g., `packages.nix`):

```nix
{ config, pkgs, userConfig, ... }:
let
  cfg = userConfig.machineConfig.glApps;
  wrap = pkg: if cfg then config.lib.nixGL.wrap pkg else pkg;
in
{
  programs.wezterm = {
    enable = true;
    package = wrap pkgs.wezterm;
  };
  
  home.packages = [
    (wrap pkgs.alacritty)
    (wrap pkgs.kitty)
    # ... other GL-dependent packages
  ];
}
```

## Technical Details

### Wrapper Behavior

When `glApps = true`:
- The wrapper creates a new derivation with wrapped binaries
- Each binary is wrapped using `makeWrapper` to execute with nixGL
- The correct nixGL variant (Mesa/Intel/Nvidia) is selected based on GPU type
- Non-bin directories from the original package are symlinked

When `glApps = false`:
- The wrapper function returns the original package unchanged
- No nixGL overhead

### Supported GPU Types

- **AMD**: Uses `nixGLMesa`
- **Intel**: Uses `nixGLIntel`
- **Nvidia**: Uses `nixGLNvidia`
- **Default**: Falls back to `nixGLMesa` if GPU type not specified

## Troubleshooting

### Application won't start with GL errors

1. Verify nixGL is installed: `which nixGLMesa` (or nixGLIntel/nixGLNvidia)
2. Check the wrapper was applied: `readlink -f $(which your-app)`
3. Test manually: `nixGLMesa your-app`

### Wrong GPU wrapper selected

Override the default wrapper:

```nix
nixGL.defaultWrapper = "nvidia";  # Force specific wrapper
```

### Package has no binaries

The wrapper only wraps executables in `/bin`. If a package has binaries in other locations, they won't be wrapped automatically.
