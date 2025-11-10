# NixOS Configuration
Configurations are for:
- Desktop (7745HX, RX7600)
- Server (Optiplex 3070 Micro)
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
- Samba fileshare mounted to hosts through VPN - Almost there
- Host simple HTML server using NginX - Need to buy domain name
- Adding or replacing Tailscale with Wireguard
- Introduce Nix-Managed Hyprland as an alternative DE
- Migrate from Home manager-based Neovim to classic dotfile style for improved portability & support - Find way to import as a flake
- Integrate more game servers - UT2004, Quake 3, Satisfactory
