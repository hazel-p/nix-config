# My NixOS Configuration
The code above is the contents of a [git repository](https://www.geeksforgeeks.org/git/what-is-a-git-repository/) hosted by [GitHub](https://github.com/), and contains a set of Nix files which together describe the configuration for almost my entire computing setup, including servers and desktop, which all run NixOS.

## What is NixOS?
![NixOS Logo](https://github.com/NixOS/nixos-artwork/blob/9d2cdedd73d64a068214482902adea3d02783ba8/logo/nixos.svg)
[NixOS](https://wiki.nixos.org/wiki/NixOS_Wiki) is an Operating System ([OS](https://en.wikipedia.org/wiki/Operating_system)), like Windows, MacOS, or Ubuntu. Specifically, it is a [Linux Distribution](https://en.wikipedia.org/wiki/Linux_distribution), which is a full OS built around the [Linux kernel](https://github.com/torvalds/linux). It is the longest-running and best supported *fully declarative* OS, and uses the [Nix ecosystem](https://wiki.nixos.org/wiki/Nix_ecosystem), in a fashion that will be covered later.

A declarative OS in this sense means that the entire computer, from the bootloader and kernel to every app and setting, and the exact version for each, is *declared* in code, allowing for full control and knowledge of the software installed at all times. This is different from an *imperative* OS (Windows, MacOS, Ubuntu, etc.), where the user installs new software as and when needed, and configures each manually each time. While convenient, this common approach does not have a set place to install, version, and configure programs, leading each program to use its own standard. This results in systems being bloated over time with forgotten and unknowable files, and where an uninstaller is unable to reliably remove every file. [Docker Compose](https://github.com/docker/compose) is a common declarative approach already widely used in servers, but Nix and NixOS allow this approach to apply to the entire computer, allowing for clean and organised desktop use.

The language used by NixOS and extended Nix ecosystem is also called [Nix](https://nix.dev/tutorials/nix-language.html), which this repository is written in. This is a necessity for this operating system, but is very simple and easy to learn - this is my first Nix project!

Each package is installed from [nixpkgs](https://search.nixos.org/packages), an online repository with over 100,000 programs packaged up and explicitly versioned using Nix's declarative language. Nixpkgs also comes with over 20,000 options for defining and configuring certain behaviour.

### Advanced Features
This project uses a mature experimental feature of Nix called [Flakes](https://wiki.nixos.org/wiki/Flakes), which defines this repository as a flake and allows other flakes, including nixpkgs and other projects not defined in nixpkgs like [nvf](https://github.com/NotAShelf/nvf), to be imported and explicitly versioned. The exact versions of every input flake are defined in [flake.lock](flake.lock), and the file defining this respository as a flake is [flake.nix](flake.nix). In my configuration, rebuilding using the flake takes the hostname of the machine it is run on and builds the system from its corresponding configuration file in [hosts](hosts/). This allows this repository to contain my personal configurations for each of my computers simultaneously. The hostname can also be appended to the flake name e.g. `--flake ./#calliope`.

My user-specific packages, dotfiles, and settings are managed by [home-manager](https://github.com/nix-community/home-manager), a Nix project for managing user-level declarations. While home-manager also can import programs from nixpkgs, it also has many unique options for [programs](https://mynixos.com/home-manager/options/programs) or [services](https://mynixos.com/home-manager/options/services).

As all programs, files, and configs in NixOS are installed into /nix/store and linked to from around the system, theoretically all NixOS needs to boot are the /boot and /nix directories, with the bootloader rebuilding the rest of the filesystem from scratch. Therefore, root can be mounted to anywhere that gets wiped on shutdown, including memory. [Impermanence](https://grahamc.com/blog/erase-your-darlings/) is a Nix project which implements this, allowing me to "persist" certain directories and keep the rest of root stored on [tmpfs](https://en.wikipedia.org/wiki/Tmpfs), a filesystem entirely in RAM. Other options exist to use a [btrfs](https://en.wikipedia.org/wiki/Btrfs) volume which gets manually swapped out on reboot, allowing me to mount previous boots, but this is slower, bulkier, and may be unnecessary for servers.

## How I use this website
I am able to rebuild all my computers from scratch according to the configurations laid out above, using a single command:

`sudo nixos-rebuild --flake github:hazel-p/nix-config`

To install new software or change settings, I add the relevant Nix expression to a file in this repository, then run this command in order to rebuild the entire system.

## About my configuration
- Unique and atomic configurations for multiple machines, including desktop and servers
- Daily automated flake bumps (Updating [flake.lock](flake.lock))
- Public secrets fully encrypted using [sops-nix](https://github.com/Mic92/sops-nix) (user password, VPN authkey)
- Basic self-hosted home servers, each with configurable [services](services/)
- [Tailscale](https://tailscale.com/) VPN network
- Modded Minecraft servers using [nix-minecraft](https://github.com/Infinidoge/nix-minecraft)
- Neovim managed by [nvf](https://github.com/NotAShelf/nvf)
- Desktop logins managed by [tuigreet](https://github.com/apognu/tuigreet)
- [Hyprland](https://wiki.hypr.land/) tiling window manager with [waybar](https://github.com/Alexays/Waybar), [rofi](https://github.com/davatorium/rofi), [awww](https://codeberg.org/LGFae/awww), and [more](hazel-home/desktop/wayland)!


## Deployed Systems
### Calliope
This is my main desktop, featuring a Ryzen 7745HX CPU, 32GB RAM, and an RX7600 GPU. It is primarily for gaming and development.

### Clio
This is my main server, a Lenovo M920q, with 32GB RAM. It will host all of my services, including a Samba NAS, Immich photos management, Jellyfin media server, and game servers. It is currently configured using Impermanence, and root is mounted to tmpfs.

### Melpomene
This is my secondary server, an Optiplex 3070 Micro with 16GB RAM. It will host my Borg backups from Clio, as well as lighter services which do not create large amounts of critical data, such as Headscale or Blocky.

### Erato
This is my laptop, a HP Elitebook 745 G2. It has been 8 and a half years since I bought it second hand so it is very unreliable. Currently not switching on.

### Thalia
This will be my Steam Deck OLED, when I get round to changing the OS over to use Jovian rather than SteamOS. 

## Layout
I have stuck to a set file heriarchy for this repository, seperating NixOS files by purpose and scope.
- [hosts/](hosts/) - NixOS files defining the hardware each host has, as well as links to the software it should have.
- [nixos/](nixos/) - NixOS files defining the system-level software that should be installed on each device.
- [services/](services/) - NixOS files defining the services the servers will run. Kept seperate from nixos/ for extensibility.
- [hazel-home/](hazel-home/) - home-manager files defining my personal user-level software and configurations.

## Inspiration:
- [NixOS Wiki](https://wiki.nixos.org)
- [Eric Cheng](https://github.com/eh8/chenglab)
- [Misterio77](https://github.com/Misterio77/nix-config)

## TODO:
Repository:
- Write a README for each folder detailing purposes

Desktop:
- Include Niri using current waybar and other Wayland WM accessories
- Fully configure and rice wlogout
- Possibly centralise colour schemes? Gruvbox-material-dark-hard is good enough

Servers:
- Server backup system using Borg backup - Need to set up full server architecture on Clio and Melpomene
- Samba fileshare mounted to hosts through VPN - Almost there, might remove all security as on private network anyway
- Buy domain name for webserver, immich, jellyfin, and headscale implementations.
- Switch from tailscale's private servers to headscale.
- Integrate more game servers - UT2004, Quake 3, Satisfactory
