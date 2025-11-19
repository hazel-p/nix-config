{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./kitty.nix
    ./zsh.nix
    ./fzf.nix
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
