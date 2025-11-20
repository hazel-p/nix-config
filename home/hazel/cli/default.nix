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
  ];

  home.packages = with pkgs; [
    # Command line tools
    fortune
    fastfetch
    bat
    tree

    # Nix-specific tools
    sops
    alejandra
  ];
}
