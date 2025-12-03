# NixOS Configuration
Configurations are for:
- Calliope  - Desktop, 7745HX, RX7600
- Clio      - Main server, Lenovo M920q
- Melpomene - Backup server, Optiplex 3070 Micro
- Erato     - HP Elitebook 745 G2
- Thalia    - Steam Deck OLED (Upcoming)

Featuring:
- Unique flakes for each individual host
- Daily automated flake bumps
- User packages and settings managed by [home-manager](https://github.com/nix-community/home-manager)
- Secrets fully encrypted using [sops-nix](https://github.com/Mic92/sops-nix)
- Logins managed by tuigreet
- Hyprland window manager with waybar, rofi, swww, and others
- Neovim managed by [nvf](https://github.com/NotAShelf/nvf)
- Basic self-hosted home servers, each with configurable services
- Tailscale VPN network
- Modded Minecraft servers using [nix-minecraft](https://github.com/Infinidoge/nix-minecraft)

Inspiration from:
- [NixOS Wiki](https://wiki.nixos.org)
- [Eric Cheng](https://github.com/eh8/chenglab)
- [Misterio77](https://github.com/Misterio77/nix-config)

Desktop To-Do List:
- Include Niri using current waybar and other Wayland WM accessories
- Configure Waybar using CSS snippets
- Add and configure SwayNC
- Improve Neovim workflow
- Possibly centralise colour schemes?

Server To-Do List:
- [Impermanence](https://grahamc.com/blog/erase-your-darlings/) via tmpfs - Will develop on branch & prototype on laptop
- Server backup system using Borg backup - Need to set up full server architecture on Clio and Melpomene
- Samba fileshare mounted to hosts through VPN - Almost there, might remove all security as on private network anyway
- Host simple HTML server using NginX - Need to buy domain name
- Implement Headscale or Wireguard - Zero trust systems
- Integrate more game servers - UT2004, Quake 3, Satisfactory
