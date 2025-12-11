# NixOS Configuration

## What is NixOS?

![NixOS Logo](https://github.com/NixOS/nixos-artwork/blob/9d2cdedd73d64a068214482902adea3d02783ba8/logo/nixos.svg)
[NixOS](https://wiki.nixos.org/wiki/NixOS_Wiki) is a declarative operating system built around the [Linux](https://github.com/torvalds/linux) kernel, and using the [Nix ecosystem](https://wiki.nixos.org/wiki/Nix_ecosystem). Declarative in this sense means that the entire system, from the deepest kernel patches and modules to each app installed and even colour scheme, and the exact version for each, is *declared* in code. This is different compared to an *imperative* system, where the user installs new software as and when needed, and configures each manually each time. This approach makes backups, changing settings, and remembering what software is installed very difficult, and can result in systems being bloated over time. This particular approach is best suited for servers, but is also very streamlined for clean and organised desktop use.

The language used by NixOS and extended Nix ecosystem is also called [Nix](https://nix.dev/tutorials/nix-language.html), which is what this repository is written in. This is a necessity for this operating system, but is very simple and easy to learn.

Each package is installed from [nixpkgs](https://search.nixos.org/packages), a git repository with over 100,000 programs packaged up and explicitly versioned using Nix's declarative language.

This repository uses a mature experimental feature of Nix called [Flakes](https://wiki.nixos.org/wiki/Flakes), which allows other flakes to be imported and versioned, including nixpkgs itself. It also allows several permutaions to deployed using the same flake, with each output depending on a certain input. In the case of this repository, this input is the hostname of the machine, and the output is the specific configuration relevant to that specific hostname. This allows this repository to contain my personal configurations for each of my computers.

## What does this repository feature?
- Unique flakes for each individual host
- Daily automated flake bumps
- User packages, dotfiles, and settings managed by [home-manager](https://github.com/nix-community/home-manager)
- Public secrets fully encrypted using [sops-nix](https://github.com/Mic92/sops-nix) (password, VPN authkey)
- Logins managed by tuigreet
- Hyprland window manager with waybar, rofi, swww, and others
- Neovim managed by [nvf](https://github.com/NotAShelf/nvf)
- Basic self-hosted home servers, each with configurable services
- Tailscale VPN network
- Modded Minecraft servers using [nix-minecraft](https://github.com/Infinidoge/nix-minecraft)
- [Impermanence](https://grahamc.com/blog/erase-your-darlings/) via tmpfs and encrypted root

## Deployed Systems
### Calliope
This is my main desktop, featuring a Ryzen 7745HX CPU, 32GB of RAM, and an RX7600 GPU. It is primarily for gaming and development.

### Clio
This is my main server, a Lenovo M920q, with 32GB of RAM. It will host all of my services, including a Samba NAS, Immich photos management, Jellyfin media server, and game servers.

### Melpomene
THis is my secondary server, an Optiplex 3070 Micro. It will host my Borg backups from Clio, as well as lighter services which do not create large amounts of critical data, such as Headscale.

### Erato
This is my laptop, a HP Elitebook 745 G2. It has been 8 and a half years since I bought it second hand so it is very unreliable. Currently not switching on.

### Thalia
This will be my Steam Deck OLED, when I get round to changing the OS over to use Jovian rather than SteamOS. 

## Inspiration:
- [NixOS Wiki](https://wiki.nixos.org)
- [Eric Cheng](https://github.com/eh8/chenglab)
- [Misterio77](https://github.com/Misterio77/nix-config)

## TODO:
Desktop:
- Include Niri using current waybar and other Wayland WM accessories
- Possibly centralise colour schemes?

Servers:
- Server backup system using Borg backup - Need to set up full server architecture on Clio and Melpomene
- Samba fileshare mounted to hosts through VPN - Almost there, might remove all security as on private network anyway
- Host simple HTML server using NginX - Need to buy domain name
- Implement Headscale or Wireguard - Zero trust systems
- Integrate more game servers - UT2004, Quake 3, Satisfactory
