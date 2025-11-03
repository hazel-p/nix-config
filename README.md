# NixOS Configuration
Configurations are for:
- Desktop (7745HX, RX7600)
- Server (Optiplex 3070 Micro)
- Laptop (HP Elitebook 740 Gen 2)

Featuring:
- Unique flakes for each individual host
- Daily flake updates
- User packages and settings managed by [home-manager](https://github.com/nix-community/home-manager)
- Secrets encrypted using [sops](https://github.com/Mic92/sops-nix)
- GNOME environment
- App appearances managed using GNOME-Apps
- Neovim managed by [nvf](https://github.com/NotAShelf/nvf)
- Basic self-hosted home server with configurable services
- Tailscale network
- Declarative modded Minecraft servers using [nix-minecraft](https://github.com/Infinidoge/nix-minecraft)

Inspiration from:
- The fantastic [nixos wiki](https://wiki.nixos.org)
- [Eric Cheng](https://github.com/eh8/chenglab)

Planned improvements:
- [Impermanence](https://grahamc.com/blog/erase-your-darlings/) via tmpfs - Big job!
- Server backup system using Borg backup - Need better physical infrastructure
- Samba fileshare mounted to hosts through VPN - Almost there
- Host simple HTML server using NginX - Need to buy domain name
- Adding or replacing Tailscale with Wireguard
- Introduce Nix-Managed Hyprland as an alternative DE
- Migrate from Home manager-based Neovim to classic dotfile style for improved portability & support - Find way to import as a flake
- Integrate more game servers - UT2004, Quake 3, Satisfactory
