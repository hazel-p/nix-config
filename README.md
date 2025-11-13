# NixOS Configuration
Configurations are for:
- Desktop (7745HX, RX7600)
- Server 1 (Optiplex 3070 Micro)
- Server 2 (Lenovo M920Q) - Upcoming
- Laptop (HP Elitebook 745 G2)

Featuring:
- Unique flakes for each individual host
- Daily automated flake updates
- User packages and settings managed by [home-manager](https://github.com/nix-community/home-manager)
- Secrets encrypted using [sops-nix](https://github.com/Mic92/sops-nix)
- GNOME desktop environment with declarative GNOME-Apps
- Neovim managed by [nvf](https://github.com/NotAShelf/nvf)
- Basic self-hosted home server with configurable services
- Tailscale network
- Modded Minecraft servers using [nix-minecraft](https://github.com/Infinidoge/nix-minecraft)

Inspiration from:
- [NixOS Wiki](https://wiki.nixos.org)
- [Eric Cheng](https://github.com/eh8/chenglab)
- [Misterio77](https://github.com/Misterio77/nix-config)

Planned improvements:
- [Impermanence](https://grahamc.com/blog/erase-your-darlings/) via tmpfs - Will develop on branch & prototype on laptop
- Server backup system using Borg backup - Need better physical infrastructure (another drive/device maybe)
- Samba fileshare mounted to hosts through VPN - Almost there, might remove all security as on private network anyway
- Host simple HTML server using NginX - Need to buy domain name
- Adding or replacing Tailscale with Wireguard
- Introduce Nix-Managed Niri or Hyprland as an alternative DE, package waybar and other essentials as a module
- Migrate from Home manager-based Neovim to classic dotfile style for improved portability & support - Find way to import as a flake
- Integrate more game servers - UT2004, Quake 3, Satisfactory
