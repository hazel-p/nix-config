{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Essentials
    ./kitty.nix
    ./zsh.nix
    ./neovim.nix
    ./git.nix

    # Useful Applets
    ./starship.nix
    ./fastfetch.nix
    ./btop.nix
    ./yazi.nix
    ./helix.nix
  ];

  home.packages = with pkgs; [
    # Command line tools
    fortune-kind
    bat
    tree
    net-tools
    busybox
    nmap

    # Nix-specific tools
    sops
    alejandra
  ];
}
