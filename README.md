# NixOS Configuration
## What is in this repository?
This repository contains a set of files which together describe the configuration for my entire computing setup, including servers and desktop. All these computers run NixOS, which allows me to run a single command which builds the system according only to the configuration laid out above.

`sudo nixos-rebuild --flake github:hazel-p/nix-config`

## What is NixOS?
![NixOS Logo](https://github.com/NixOS/nixos-artwork/blob/9d2cdedd73d64a068214482902adea3d02783ba8/logo/nixos.svg)
[NixOS](https://wiki.nixos.org/wiki/NixOS_Wiki) is a declarative operating system built around the [Linux](https://github.com/torvalds/linux) kernel, and using the [Nix ecosystem](https://wiki.nixos.org/wiki/Nix_ecosystem).

Declarative in this sense means that the entire system, from the deepest kernel patches and modules to each app installed and even colour scheme, and the exact version for each, is *declared* in code. This is different from an *imperative* system, where the user installs new software as and when needed, and configures each manually each time in config files strewn around the computer. This common approach makes backups, changing settings, and remembering what software is installed very difficult, and can result in systems being bloated over time. Declarative approaches such as Nix and [Docker Compose](https://github.com/docker/compose) are incredibly well suited for servers, but Nix streamlines the process for clean and organised desktop use as well.

The language used by NixOS and extended Nix ecosystem is also called [Nix](https://nix.dev/tutorials/nix-language.html), which this repository is written in. This is a necessity for this operating system, but is very simple and easy to learn - this respository is my first Nix project!

Each package is installed from [nixpkgs](https://search.nixos.org/packages), a git repository with over 100,000 programs packaged up and explicitly versioned using Nix's declarative language.

This project uses a mature experimental feature of Nix called [Flakes](https://wiki.nixos.org/wiki/Flakes), which defines this repository as a flake and allows other flakes to be imported and versioned, including nixpkgs itself, as well as other projects not defined in nixpkgs like [nvf](https://github.com/NotAShelf/nvf). The exact versions of every input flake are defined in [flake.lock](flake.lock), and the flake for this repository is defined in [flake.nix](flake.nix). In my configuration, the flake takes the hostname of the machine it is run on and builds the system from its corresponding configuration file in [./hosts/](hosts/). This allows this repository to contain my personal configurations for each of my computers.

## What are the features of my configuration?
- Unique flakes for multiple machines, including desktop and servers
- Daily automated flake bumps (Updating [flake.lock](flake.lock))
- User-specific packages, dotfiles, and settings managed by [home-manager](https://github.com/nix-community/home-manager)
- Public secrets fully encrypted using [sops-nix](https://github.com/Mic92/sops-nix) (user password, VPN authkey)
- Logins managed by [tuigreet](https://github.com/apognu/tuigreet)
- [Hyprland](https://wiki.hypr.land/) tiling window manager with waybar, rofi, swww, and more!
- Neovim managed by [nvf](https://github.com/NotAShelf/nvf)
- Basic self-hosted home servers, each with configurable services
- [Tailscale](https://tailscale.com/) VPN network
- Modded Minecraft servers using [nix-minecraft](https://github.com/Infinidoge/nix-minecraft)
- Opt-in [Impermanence](https://grahamc.com/blog/erase-your-darlings/) via tmpfs with encrypted root

## Deployed Systems
### Calliope
This is my main desktop, featuring a Ryzen 7745HX CPU, 32GB RAM, and an RX7600 GPU. It is primarily for gaming and development.

### Clio
This is my main server, a Lenovo M920q, with 32GB RAM. It will host all of my services, including a Samba NAS, Immich photos management, Jellyfin media server, and game servers. It is currently configured using Impermanence.

### Melpomene
This is my secondary server, an Optiplex 3070 Micro with 16GB RAM. It will host my Borg backups from Clio, as well as lighter services which do not create large amounts of critical data, such as Headscale or Blocky.

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
