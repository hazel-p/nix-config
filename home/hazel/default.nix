{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./packages.nix
    #./cli
    ./cli/git.nix
    ./cli/zsh.nix
  ];

  home = {
    username = "hazel";
    homeDirectory = "/home/hazel";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.droid-sans-mono
  ];
}
