<img src="assets/chillet.png" alt="Custom Image" height="100"/> 
<span style="font-size: 26px; font-weight: bold; margin-left: 12px; color: #FFD700; font-family: 'Arial', sans-serif; letter-spacing: 1px; text-shadow: 0px 0px 8px rgba(255, 215, 0, 0.8);">
    Crafted Dotfiles by <span style="color: #00FFFF; text-shadow: 0px 0px 8px rgba(0, 255, 255, 0.8);">c0d3h01</span>
</span>

## 📂 **Installation**
```bash
sudo nixos-rebuild switch --flake github:c0d3h01/dotfiles#NixOS --fast
```

## **Helper functions ⤵**

### 🔄 **Refresh Git Cloning While Building**
If you need to **force a fresh clone of the repository** while rebuilding, use `--refresh`:
```bash
sudo nixos-rebuild switch --flake github:c0d3h01/dotfiles#NixOS --refresh
```

### 🚀 **Use Impure Mode (`--impure`)**
By default, **Nix flakes enforce purity**, meaning they strictly use the configurations and dependencies defined in your flake. However, if you need to allow system state (like `/etc/nixos/hardware-configuration.nix`) to influence the rebuild, use `--impure`:
```bash
sudo nixos-rebuild switch --flake github:c0d3h01/dotfiles#NixOS --impure
```
🔹 **When to use `--impure`?**  
- If you **don’t want to apply** the `hardware-configuration.nix` from your dotfiles and instead use the one in `/etc/nixos/`.  
- If you have **system-dependent configurations** that should not be overridden by the flake.  

### 📁 **Dotfiles Structure**
- ⟶ [Click HERE!](https://github.com/c0d3h01/dotfiles/blob/main/structure.md)
