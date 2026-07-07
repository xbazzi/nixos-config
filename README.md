# nixos-config

My NixOS flake configuration for a single x86_64 desktop. System and Home Manager are managed together.

## Stack

| Layer | Tool |
|---|---|
| Window manager | Hyprland |
| Shell | Zsh + Starship |
| Terminal | Kitty |
| Theme engine | Stylix (Tokyo Night Storm) |
| Secure boot | Lanzaboote |
| Display manager | greetd + tuigreet |
| Audio | PipeWire |
| Graphics | AMD |

## Structure

```
flake.nix          # Inputs, system + home-manager wired as one NixOS module
system/            # NixOS system configuration
  configuration.nix  # Hardware, users, core services
  packages.nix       # System-wide packages
  *.nix              # Feature modules (audio, fonts, network, GPU…)
home/              # Home Manager configuration
  home.nix           # Base home settings, Stylix
  packages.nix       # User packages
  *.nix              # App/tool modules (Hyprland, Zsh, VSCode, Kitty…)
```

## Usage

**Rebuild system** (handles both NixOS and Home Manager in one shot):
```sh
sudo nixos-rebuild switch --flake .#nixos
```

