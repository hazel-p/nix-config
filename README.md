# NixOS Configuration
Configurations are for:
- Calliope  - Desktop, 7745HX, RX7600
- Clio      - Main server, Lenovo M920q
- Melpomene - Backup server, Optiplex 3070 Micro
- Erato     - HP Elitebook 745 G2
- Thalia    - Steam Deck OLED (Upcoming)

Featuring:
- Unique flakes for each individual host
- Daily automated flake updates
- User packages and settings managed by [home-manager](https://github.com/nix-community/home-manager)
- Secrets encrypted using [sops-nix](https://github.com/Mic92/sops-nix)
- Logins managed by greetd-tuigreet
- GNOME desktop environment with declarative GNOME-Apps
- Hyprland window manager with waybar, rofi, swww, and others
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
- Include Niri using premade waybar and other Wayland WM accessories
- Migrate from Home manager-based Neovim to classic dotfile style for improved portability & support - Find way to import as a flake
- Integrate more game servers - UT2004, Quake 3, Satisfactory
