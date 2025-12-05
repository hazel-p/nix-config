{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./kitty.nix
    ./zsh.nix
    ./helix.nix
    ./neovim.nix
    ./btop.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    # Command line tools
    fortune
    fastfetch
    bat
    tree
    net-tools

    # Nix-specific tools
    sops
    alejandra
  ];
}
