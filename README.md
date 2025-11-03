# NixOS Configuration
Configurations are for:
- Desktop (7745HX, RX7600)
- Server (Optiplex 3070 Micro)
- Laptop (HP Elitebook 740 Gen 2)

Featuring:
- Unique flakes for each individual host
- Daily flake updates
- Secrets encrypted using SOPS

- GNOME environment
- App appearances managed using GNOME-Apps
- Console features Kitty, Zshell, and Neovim

- Basic self-hosted home server with configurable services
- Tailscale network
- Declarative modded Minecraft servers

Inspiration from:
- Mostly [Eric Cheng](https://github.com/eh8/chenglab)

Planned improvements:
- Impermanence via tmpfs ([Source](https://grahamc.com/blog/erase-your-darlings/))
- Server backup system using Borg backup
- Samba fileshare mounted to hosts through VPN
- Buy domainhtml hosting using NginX
- Adding or replacing Tailscale with Wireguard
- Introduce Nix-Managed Hyprland as an alternative DE
- Migrate from Nix-based Neovim to a classic dotfile style for improved portability & support
